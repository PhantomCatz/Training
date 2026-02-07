TypeScript
==========

In JavaScript, it can be hard to know what certain objects are, and inputting
data usually relies on an implicit contract. For example, in

> ```Javascript
> function processData(arr) {...}
> ```

what data does this function process? What does the function return? Does it
even return anything? The only thing that you can infer from this is that it
takes an array. Without knowing the internals, you can only guess at the rest.

Many other languages have *types*, which specify what an object is. For example,
the same program written in Java may look like this:

> ```Java
> double processData(double[] arr) {...}
> ```

You can see how this provides much more information to the users of the
function. Java also prevents users from passing something of a different type,
like just a plain `double`, into the function.

Typescript aims to resolve this issue by adding type annotations to JS, which
results in something like this:

> ```Typescript
> function processData(arr: number[]): number {...}
> ```

These annotations do not affect the end result, as TS compiles into plain JS
without changing the structure of code.

Terminology for this training:
 * Value: anything that can be assigned to a variable
 * Primitive: anything not considered an object in JS
 * Object: anything considered an object in JS

## Types

A type is a descriptor of an value, showing what kind of value it is. There are
a few builtin types, and you can create your own types. Types are added with a
colon ('`:`')

> ```Typescript
> let x: number = 1;
> let y: string = "foo";
> let z: boolean = true;
> let error: number = "foo"; // Compile error
> ```

Values can only be assigned to a variable that accepts that type. If you try to
assign a value of a different type, say a `string` to a `number` variable, it
will give a compile error. This is what makes Typescript good, as it allows you
to check that you always have the right type of value.

You can also have types of `null` or `undefined`, which can only store values of
`null` and `undefined`, respectively.

You can make an array type by putting '`[]`' after the name of a type. For
example,

> ```Typescript
> let x: number[] = [1, 2, 3];
> let y: boolean[][] = [[true, false], [false, true]];
> ```

To refer to a type multiple times, you can make a type alias. For example,

> ```Typescript
> type Data = number[];
> let x: number[] = [1, 2, 3];
> let z: Data = x;
> ```

You can also make an object type by writing what keys the object has:

> ```Typescript
> type Point = {
>   x: number;
>   y: number;
> };
> let x: Point = {x: 1, y: 2};
> ```

TODO: maybe expand upon this?

You can write a type of `any` to ignore type-checking for a variable. For
example, the following problem has no errors:

> ```Typescript
> let x: any = 1;
> x = "foo";
> x = true;
> x = 2;
> ```

This may seem convenient, but it actually makes things worse. This makes it so
that the code is basically just written in Javascript, and we lose all the
benefits from the type-checking system. Thus, you should only use `any` when you
truly need it.

## Functional Types

In Javascript, functions are first-class objects. This means that you will often
pass around functions like any other value. Look at a standard Javascript
function:

> ```Javascript
> function greaterThan(a, b) { ... }
> ```

You have already seen how to write a function in Typescript, but it will be
shown again:

> ```Typescript
> function greaterThan(a: number, b: number): boolean { ... }
> ```

Each argument is followed by a type declaration, exactly like when declaring a
variable. The argument list is also followed by a type declaration, which
specifies the return type of the function. Typescript will ensure that the
return type of the function is always correct, so that you don't make mistakes
like returning a number from this function.

To specify a function object, you use the lambda notation:

> ```Typescript
> function greaterThan(a: number, b: number): boolean { ... }
> let f: (c: number, d: number) => boolean = greaterThan;
> ```

The function type will specify a function that matches the *signature* of the
type. This means that you do not have to match the parameter names, you have to
have the argument and return types match. Anonymous functions are treated the
same as other functions.

## Union Types

You can combine types into a *union* by using '`|`'. For example,

> ```Typescript
> let x: number | string = "foo";
> x = 2;
> x = true; // Compile error
> ```

In a union, the variable can be value of any of the members of the union. This
will allow you make more useful annotations, as having only one type is rather
restrictive.

> ```Typescript
> function toNumber(v: number | string) {
>   let num = v;
>   if(typeof num === "string") {
>     num = Number(v);
>   }
>   return num;
> }
> ```

This union is treated as any other type. For example, you could use it in an
array (`(number | string)[]`), or anything else that requires a type.

***The following is not necessary to learn, but it is provided for reference
if you happen to need it***

## Generic types

Suppose you want to make things that work on a certain data structure, like a
sorting algorithm.

> ```Typescript
> function sort(arr: string[], comp: (a: string, b: string) => boolean): void{ ... }
> ```

This takes in an array, as well as a comparison function. It is also typed, so
that it can take advantage of the type system. However, what if you wanted to
sort an array of `number`s? You can rewrite it, replacing every `string` with
`number`, but it would quickly grow unwieldy when you have more uses for a sort
function. You may try to write it like this:

> ```Typescript
> function sort(arr: any[], comp: (a: any, b: any) => boolean): void { ... }
> ```

However, this will not work properly. The type system will allow any array to be
passed in, such as an array of numbers, and any comparison function, such as one
for strings. It does not ensure that the types of the arguments match up
correctly.

To solve this problem, you can use *generics*. Generics allow for you to use a
stand-in type as a replacement for an arbitrary fixed type.

> ```Typescript
> function sort<T>(arr: T[], comp: (a: T, b: T) => boolean): void { ... }
> ```

This function takes a *type parameter* `T` along with its arguments, and it
returns nothing (`void`). To use it,
you would write

> ```Typescript
> sort<number>([2, 1, 3], (a: number, b: number) => a < b);
> ```

This generic function now can take any type of array, but it still ensures that
the types of the array and the comparison function match. It also ensures that
the array only contains one type of element, as opposed to `any[]`.
