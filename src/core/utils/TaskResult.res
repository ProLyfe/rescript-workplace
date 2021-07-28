type t<'a, 'e> = Task.t<result<'a, 'e>>
type computation<'r, 'e> = Task.computation<result<'r, 'e>>
type cancelFunction = Task.cancelFunction

let from = Task.from
let make = comp => Task.make(comp)
let pure = result => Task.pure(result)
let fork = task => Task.fork(task)

let forkSwitch = (tr, ~onOk, ~onErr) =>
  fork(tr, r =>
    switch r {
    | Ok(a) => onOk(a)
    | Error(e) => onErr(e)
    }
  )

let tap = Task.tap

let map = (task, f) => Task.map(task, Result.map(_, f))

let mapError = (task, f) =>
  Task.map(task, x =>
    switch x {
    | Ok(a) => Ok(a)
    | Error(e) => Error(f(e))
    }
  )

let flatMap = (task, f) =>
  Task.flatMap(task, x =>
    switch x {
    | Ok(a) => f(a)
    | Error(e) => pure(Error(e))
    }
  )

let product = (task1, task2) =>
  Task.map2(task1, task2, (a, b) =>
    switch (a, b) {
    | (Ok(a), Ok(b)) => Ok((a, b))
    | (Error(e), _)
    | (_, Error(e)) =>
      Error(e)
    }
  )

let map2 = (task1, task2, f) => product(task1, task2)->map(((a, b)) => f(a, b))

type todoType = {
    name: string,
    status: bool
};