// Generated by ReScript, PLEASE EDIT WITH CARE


var friendAccount = {
  TAG: /* Instagram */0,
  _0: "Jenny"
};

console.log(friendAccount);

var newAccount;

if (typeof friendAccount === "number") {
  console.log("Ce n'est ni l'un ni l'autre");
  newAccount = undefined;
} else if (friendAccount.TAG === /* Instagram */0) {
  console.log("C'est bien Insta : " + "Jenny");
  newAccount = undefined;
} else {
  console.log("C'est bien FB avec le nom " + "Jenny");
  newAccount = undefined;
}

var harryPotter = {
  TAG: /* Available */0,
  _0: {
    title: "Harry Potter",
    author: "JK Rolling",
    isbn: 2131801381
  }
};

var rayane = {
  name: "Rayane",
  age: 21
};

var centralPark_0 = {
  title: "Central Park",
  author: "Musso",
  isbn: 377838588
};

var centralPark = {
  TAG: /* Borrowed */1,
  _0: centralPark_0,
  _1: rayane
};

function isBookAvailable(book) {
  if (book.TAG === /* Available */0) {
    return "Le livre " + book._0.title + " est disponible";
  } else {
    return "Le livre est " + book._0.title + " est emprunté par " + book._1.name;
  }
}

console.log(isBookAvailable(harryPotter));

var myAccount = {
  TAG: /* Facebook */1,
  _0: "Josh",
  _1: 26
};

export {
  myAccount ,
  friendAccount ,
  newAccount ,
  harryPotter ,
  rayane ,
  centralPark ,
  isBookAvailable ,
  
}
/*  Not a pure module */
