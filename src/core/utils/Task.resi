type t<'a>
type computation<'a> = ('a => unit) => unit
type cancelFunction = unit => unit

let from: (('a => unit) => cancelFunction) => t<'a>

let make: computation<'a> => t<'a>

let pure: 'a => t<'a>

let fork: (t<'a>, 'a => unit) => cancelFunction

let map: (t<'a>, 'a => 'b) => t<'b>

let tap: (t<'a>, ~onFork: unit => unit=?, 'a => unit) => t<'a>

let flatMap: (t<'a>, 'a => t<'b>) => t<'b>

let product: (t<'a>, t<'b>) => t<('a, 'b)>

let map2: (t<'a>, t<'b>, ('a, 'b) => 'c) => t<'c>
