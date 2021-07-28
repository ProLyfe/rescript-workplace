// type t<'a, 'b> =
//   | Ok('a)
//   | Error('b) 

// type responseError = NotAvailable | NotFound
// type queryResult = t<string, responseError>

// let failedQuery =  (username: string): queryResult => {
//     Error(NotAvailable);
// };


// type myResponse =
//   | Yes
//   | No
//   | PrettyMuch

// let areYouCrushingIt = Yes

type account =
  | None
  | Instagram(string)
  | Facebook(string, int)

let myAccount = Facebook("Josh", 26)
let friendAccount = Instagram("Jenny")
Js.log(friendAccount)

let newAccount: unit =
    switch friendAccount {
    | Instagram(x) => Js.log(`C'est bien Insta : ${x}`)
    | Facebook(x, _) => Js.log(`C'est bien FB avec le nom ${x}`)
    | None => Js.log("Ce n'est ni l'un ni l'autre")
    }


// Bibliothèque

type book = {
    title: string,
    author: string,
    isbn: int,
};

type client = {
    name: string,
    age: int,
}

type bookDisponibility = 
    | Available(book)
    | Borrowed(book, client)


//Available :

let harryPotter: bookDisponibility = Available({
    title: "Harry Potter",
    author: "JK Rolling",
    isbn: 2321414141221,
});

//Borrowed:

let rayane: client = {
    name: "Rayane",
    age: 21,
};

let centralPark: bookDisponibility = Borrowed({
    title: "Central Park",
    author: "Musso",
    isbn: 2199401094140,
}, rayane);



let isBookAvailable = (book): string => {
    switch book {
    | Available(x) => `Le livre ${x.title} est disponible`
    | Borrowed(x, y) => `Le livre est ${x.title} est emprunté par ${y.name}`
    }
}

Js.log(isBookAvailable(harryPotter));