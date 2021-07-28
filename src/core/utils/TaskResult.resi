@genType.as("taskResult")
type t<'a, 'e>
type computation<'a, 'e> = (result<'a, 'e> => unit) => unit
type cancelFunction = unit => unit

let from: ((result<'a, 'e> => unit) => cancelFunction) => t<'a, 'e>

@genType
let make: computation<'a, 'e> => t<'a, 'e>

@genType
let pure: result<'a, 'e> => t<'a, 'e>

@genType
let fork: (t<'a, 'e>, result<'a, 'e> => unit) => cancelFunction

@genType
let forkSwitch: (t<'a, 'e>, ~onOk: 'a => unit, ~onErr: 'e => unit) => cancelFunction

let map: (t<'a, 'e>, 'a => 'b) => t<'b, 'e>

let mapError: (t<'a, 'e1>, 'e1 => 'e2) => t<'a, 'e2>

let tap: (t<'a, 'e>, ~onFork: unit => unit=?, result<'a, 'e> => unit) => t<'a, 'e>

let flatMap: (t<'a, 'e>, 'a => t<'b, 'e>) => t<'b, 'e>

let product: (t<'a, 'e>, t<'b, 'e>) => t<('a, 'b), 'e>

let map2: (t<'a, 'e>, t<'b, 'e>, ('a, 'b) => 'c) => t<'c, 'e>

@genType
type todoType = {
    name: string,
    status: bool
};