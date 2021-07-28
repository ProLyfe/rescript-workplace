type cancelFunction = unit => unit
type computation<'a> = ('a => unit) => unit
type t<'a> = ('a => unit) => cancelFunction

let from = taskLike => taskLike

let make = (computation, cb) => {
  let cancelled = ref(false)
  computation(res =>
    if !cancelled.contents {
      cb(res)
    }
  )
  () => cancelled := true
}

let pure = (value, cb) => {
  cb(value)
  () => ()
}

let fork = (f, x) => f(x)

let map = (task, f, cb) => task(a => f(a)->cb)

let call = f => f()

let tap = (task, ~onFork=?, f, cb) => {
  Option.forEach(onFork, call)
  task(v => {
    f(v)
    cb(v)
  })
}

let flatMap = (task, f, cb) => {
  let cancels = ref(list{})
  cancels := list{task(a => {cancels := list{f(a, cb), ...cancels.contents}})}
  () => List.forEach(cancels.contents, call)
}

let product = (task1, task2, cb) => {
  let a = ref(None)
  let b = ref(None)
  let cb' = (r, v) => {
    r := Some(v)
    switch (a.contents, b.contents) {
    | (Some(a), Some(b)) => cb((a, b))
    | _ => ()
    }
  }
  let cancels = list{task1(cb'(a)), task2(cb'(b))}
  () => List.forEach(cancels, call)
}

let map2 = (task1, task2, f) => product(task1, task2)->map(((a, b)) => f(a, b))
