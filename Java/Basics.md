1: Basics
=========

> **Note:** When following this document, and others, please do not copy the
> text from here. Type it into your editor yourself. You will not learn if you
> just copy what is here. You will also not learn if you use AI. Instead, you
> will become stupid.

## 1.1: Introduction

Here is a simple program in Java:

> ```Java
> public class Main {
>       public static void main(String[] args) {
>           System.out.println("Hello world!");
>       }
> }
> ```

Open your code editor and type this in. Try to run this program. It should print

> ```
> Hello world!
> ```

Note that this text is exactly the same as the text inside the double quotes
(""). The effect of this program is to print out what is inside the double
quotes.

Java has a syntax, or grammar, checker, which means that it will not compile if
any part of a program is wrong. Furthermore, Java is a compiled language, which
means that it translates the human-readable code into something readable by the
computer. This also means that the program will not be able to run if it does
not compile. Thus, you must resolve any compile errors if you get them.

Code blocks are separated and delimited by braces ('`{`', '`}`'). For now, all
code must be enclosed within the block starting with `public static void main`.
Moreover, every statement in Java must end with a semicolon (`;`). The quotes
and text within the quotes is called a `String`. Functions are called with
parentheses. If you call `System.out.println`, it will print out what you give
it to the standard output. 

A string is a sequence of characters. Characters may be characters in the
English alphabet, but they may also be other symbols, such as '`_`', '`*`', etc.
When making a string in Java, it must be on a single line. Thus,

> ```
> "Hello
>  World!"
> ```

is not a valid string. Try to print out a different line.


## 1.2: Program Execution

In the code given in the previous example, the `main` function is the entry
point to the program. This means that when running the program, the `main`
function is the first to run. In Java, code is executed sequentially, from top
to bottom. A line will run to completion before running the next one. Most lines
are separated by semicolons. For example, if the code

> ```Java
> System.out.println("Printing 1.");
> System.out.println("Printing 2.");
> ```

were to run, it will output the text

> ```
> Printing 1.
> Printing 2.
> ```

only, not anything else, such as having the wrong order, or having one line in
displayed in the middle of the other.

The following section will assume that you have set up your IDE.

To create the program, right click in your file tree and choose to create a
class. It may give you the option to start with a `main` function. For these
examples, you should accept this. You can now type the code into the appropriate
location, inside the `main` function.

To run the program, find a green triangle near the top of your screen. A
terminal display should appear, showing the ouput of the program.

From now on, unless otherwise stated, the programs shown will be understood to
be written inside a `main` function.


## 1.3: Printing

When using `System.out.println`, the program will automatically append a newline
to the end of your text. This means that every time you use this function, it
will put your text on its own line. Although this is typically what is wanted,
sometimes it may be desirable to put text side-by-side. To do so, you may use
the similar-looking `System.out.print` function instead. This will place exactly
the text you provide it into the standard output, without adding extraneous
newlines. For example, the code

> ```Java
> System.out.print("Foo");
> System.out.print("Bar");
> ```

will output the text `FooBar`. We will cover outputting to other locations
later.


## 1.4: Constants, Variables, and Assignment

In the pursuit of efficient coding, you do not want to keep writing out the same
values every time. Furthermore, you may not even know the value of something
when writing the code, only at runtime. For this purpose, we have variables. For
the simplest usage, you can use a variable with

> ```
> {Type} {Variable Name} = {Expression};
> ```

We will talk about types later. The variable name is a case-sensitive string
that cannot contain certain special characters, including whitespace. For now,
you can use any letter in the English alphabet, underscores, and numbers.
However, the variable will only be able to start with a letter. The expression
is the initial value that the variable is set to.

Variables are slightly different from the indeterminate values found in math.
Here, they are more like an alias, which just refer to a value inside the
program. When using a variable, you just write the name of it. As an example,

> ```Java
> String str = "Foo";
> System.out.println(str);
> ```

will output the text `Foo`. In Java, the type of strings is `String`. Note the
capital letter at the beginning. For now, once you have created a variable, you
cannot create another variable with the same name. For example, the code

> ```Java
> String str = "Foo";
> String str = "Bar";
> ```

will not compile. Instead, you can reassign variables with the syntax

> ```
> {Variable Name} = {Expression};
> ```

This will change the value referred to by the variable to the new expression.
For example,

> ```Java
> String str = "Foo";
> str = "Bar";
> System.out.println(str);
> ```

will output `Bar`.


## 1.5: Numbers and Math Operators

Note: Due to the complexity, more specific information about types for numbers
will be moved to a different section. This section will just introduce the
basics on the types, as well as providing information on how to actually perform
arithmetic.

As a widespread language, Java naturally has support for arithmetic. The
simplest type of numbers are integers. These are standard in math, so not many
properties need to be explained. However, it should be noted that all values in
Java are bounded. For example, the standard integers, `int`s, are bounded in
magnitude of ~2 billion. This should normally be sufficient for any purposes
here.

When doing arithmetic with integers, you can do a few standard operations, such
as addition, subtraction, and multiplication. With division, there is the
standard quotient, with a few differences, and the modulus, or remainder,
operator.

### Literals

A literal is a value in a program, whose representation is its actual value,
rather than an alias. For example, `10` is a number literal, `"Foo"` is a string
literal, while `foo` and `bar` are not literals.

Integers are represented normally, as a sequence of digits in base ten, with the
higher order digits on the left. Thus, you can write values like `0`, `1`, or
`31415`. Leading zeros are not allowed, but you can optionally put a single
underscore between digits, for legibility. For example, `123_456_789` is
equivalent to `123456798`, but `00100` would not be what you expect. We will
elaborate on this further. Finally, for some bases more useful in certain cases,
you can add a prefix to the number to specify a base other than ten. The
prefixes allowed are:

 * `0x` or `0X`, for hexadecimal,
 * `0`, for octal,
 * `0b` or `0B`, for binary.

From this, it is evident that having leading zeros on an integer literal would
produce an octal value, so that `010` would be equivalent to `8`. Integers can
optionally be prepended with a sign, one of `+` or `-`. The positive sign does
nothing, and the negative sign makes the number negative.

### Addition, Unary Plus, and Incrementing

To add numbers, just use the `+` operator. For example, `1+2` is equal to `3`.
The plus sign can be adding to the front of a single number, like `+1` or `+x`,
where x is a number variable, which effectively does nothing. You can increment
a variable by one using `++x` or `x++`. There are a few things to note:

 * These incrementing operators can be used inside expressions. Thus, an
   expression like `1 + ++x` is ugly, but valid code.
 * When using these inside expressions, the position of the operator matters
 * `++x` increments the variable before evaluating. Thus, if `x` were initially
   `1`, then `1 + ++x` would be equal to `3`, since `1 + (2)` equals `3`. After
   evaluating the expression, `x` would be equal to `2`.
 * `x++` increments the variable after evaluating. Thus, if `x` were initially
   `1`, then `1 + x++` would be equal to `2`, since `1 + (1)` equals `2`. After
   evaluating the expression, `x` would be equal to `2`.
 * This may be confusing to some, so please do not make expressions with these
   operators. They should never be necessary.

### Subtraction, Unary Minus, and Decrementing

To subtract numbers, just use the `-` operator. This is similar to the addition
operator. The unary `-` negates the number. The decrement operator, `--`, works
the same way as the incrementing operators.

### Multiplication, Division, Modulo (Remainder) Operations

To multiply, divide, or get modulus, use `*`, `/`, and `%`, respectively. These
operators are used the same way as addition and subtraction. Thus, you can make
expressions like `2 * 3`, `2 / 3`, and `2 % 3`. The multiplication is pretty
standard. Division by zero gives an error. Furthermore, when dividing integers
by integers, the division is treated as division with truncation. This means
that the result is rounded towards zero. Thus, `3 / 2` is equal to `1`, not
`1.5`, since the result discards the fractional part. `-1 / 2` is equal to `0`,
since the result, `-0.5`, is rounded towards `0`.

The modulo operator gives the remainder of a division, such that the expression
`(x / n) * n + (x % n)` is equal to `x`. Note that rounding can be thought of as
occuring after every operation, not at the end of the expression. For those who
know, the modulo operator is not the same as in math, as it can give negative
values.

Note that there is no built-in exponential operator, you have to implement one
yourself. However, it may suffice to use `Math.pow`.

### Precedence and Order of Operations

Operators have a certain precedence, that is, they have a certain evaulation
order when inside an expression. Here is a list for these operators. Note that
you do not have to memorise these, but most should be rather obvious.

The different orders can be found from a quick search. Just note that most
operations follow their normal order in math, and that a certain order can be
forced by using parentheses.

### Floating Point Numbers

In Java, aside from integers, there are also floating point numbers, which
approximate real numbers. The usage of them is mostly similar to integers. Any
operations that act on FP numbers will also be converted to an FP value.
Division with these will give the actual quotient, rather than the truncated
value.


## 1.6: Types

Java is a strictly typed language. This means that all values have a "type"
attached to them, and all operations involving that value must be permittable
for that type. When compared with languages such as Python or Javascript, this
seems rather strict, but it allows for the code to be checked for correctness at
runtime and it gives the user more control over what they handle.

A type specifies what kind of value a variable refers to. They may have certain
operations associated with them. The Java compiler checks your code for
correctness by ensuring that only the operations known to be on a type can be
applied to a variable of that type. For example, if you had an object of type
`T`, but it is not known that it has a method `foo`, then you would not be
allowed to use it. We will talk about methods alter, but for now they can be
thought of as functions attached to objects.

Suppose you have an apple in your hand. Although I have not stated exactly what
you have in your hand, the common properties of all appkes gives you some
information into what you are holding. In this example, 'apple' is the type, and
the specific one you are holding is an object of said type.

### Primitive Types

Java has eight primitive types. These types just hold a single value, with
nothing else attached to them. For example, an `int` just stores its value and
does have any methods attached to it. We will talk about methods later. The
eight primitive types are: `boolean`, `byte`, `char`, `double`, `float`, `int`,
`long`, and `short`. Of these, `byte`'s, `char`'s, `int`'s, `long`'s, and
`short`'s are all integral types. However, a `char` represents a character, so
although all the normal operations can be applied to `char`'s, they should be
treated a bit differently. The other integers vary by their types. `int` is the
standard value to use, with a size of ~2 billion. The sizes are shown below.

|    Type | Minimum Value | Maximum Value |    Size |
|--------:|--------------:|--------------:|--------:|
|  `byte` |        `-2^7` |     `2^7 - 1` |  8 bits |
| `short` |       `-2^15` |    `2^15 - 1` | 16 bits |
|  `char` |           `0` |    `2^16 - 1` | 16 bits |
|   `int` |       `-2^31` |  `2 ^ 31 - 1` | 32 bits |
|  `long` |       `-2^63` |    `2^63 - 1` | 64 bits |

Note that for everything except chars, there is one more of the negative values
for that type than positive values. This is due to how the integers are
represented. We will talk more about this later.

To make a character literal, write `'x'`, where `x` is the desired character.
How would you write the literal for a single quote, then? You have to escape the
quote with a backslash ('`\`'), i.e. `'\''`. The backslash is a special
character in Java, used to escape other characters, that is, allow the user to
write the special characters or characters otherwise used to delimit certain
texts. For example, in a string, you can escape a quote inside a string with a
backslash. Thus, `"\"foo\""` is a valid string in Java, holding the text
`"foo"`.

### Others

Another type that you have already seen is `String`, the type of strings in
Java. This is special, as you can construct strings from a literal by using
double quotes. Furthermore, any object is able to be converted into a String, so
they may seem more flexible than most other objects.

A type can be a subtype of another type. Suppose we have two types, `A` and `B`,
where `B` is a subtype of `A`. This means that all objects that are of type `B`
are of type `A`, but the converse is not necessarily true. Anything that a
supertype can do, a subtype can do, but the converse is not necessarily true.
Since knowing that an object is type `A` is not enough to determine that it is
also of type `B`, the subtype gives more information than the supertype.

Values that are not primitive are called objects. There is a common supertype of
all objects, namely `Object`. When a type is a subtype of another type, it
inherits all of its properties. We will talk more about this later.

### Default Values

In Java, any value that is not assigned explicitly is assigned a default value.
For primitives, this is either `0`, for number types, or `false` for booleans.
For objects, there is a special value called `null`, which can be assigned to
any type. The `null` value does not act as an object and, in fact, gives an
error when trying to use it as such. This is typically only used to show the
absence of a real value. You can assign the `null` value explicitly as well.

### Casting

Suppose you have 2 types, `A` and `B`, and that `B` is a subtype of `A`. Suppose
further that you have an object of type `B`, `b`. Now consider the following
code:

> ```Java
> A a = b;
> B b2 = a;
> ```

Although this seems to make sense, as it is known that `b` is of type `B`, and
thus `a` would also be of type `b`, the second line would give a compiler error
for mismatched types. This is because the compiler only assumes as much
information as is explicitly given. Thus, it sees that `a` is of type `A`, and
only supposes that much for future type checks. Since an object of type `A` is
not necessarily of type `B`, the compiler does not accept this possibly unsafe
code. Now consider the following code:

> ```Java
> A a = b;
> B b2 = (B) a;
> ```

This code compiles. But what is happening? On the second line, the type `B` is
surrounded in parentheses before the object `a`. This is what is known as a
*type cast*. Types can be automatically converted between compatible
conversions, that is, going from a subtype to a supertype, but when going the
other way, you have to force the conversion with casts. If you happen to make a
cast that does not work, i.e. your object is not actually of they type that you
are attempting to cast to, then you will get an error, `ClassCastException`. We
will talk more about type conversions and type safety later.

### Number Types

When using different number types, the values will be automatically converted
into matching types, attempting to expand smaller types if needed. Thus, adding
an `int` and a `byte` will result in the `byte` value being converted into an
`int` first, then performing the addition. The order of conversion is as
follows:

`byte` -> `short`/`char` -> `int` -> `long` -> `float` -> `double`

This is similar to the conversions between objects. To convert downwards, you
must use a cast like `(byte) 10`. Note that integer literals are implicitly of
type integer.

This casting explains the differences between operations involving floating
point numbers and those not involving them. Casts implicitly occur after each
operation when needed, not after or before the whole expression.


## 1.7: Strings

The strings in Java are special, as there is a built-in string literal like many
of the primitive types, yet is has all of the functionalities of an object. To
see this, consider the following code:

> ```Java
> String s1 = "asdf";
> String s2 = "qwerty";
> 
> int v1 = 123;
> 
> System.out.println(s1);
> System.out.println(s2.length());
> System.out.println(s1 + s2);
> System.out.println(s1 + v1);
> System.out.println(s1.substring(2));
> ```

This will output the following:

> ```
> asdf
> 6
> asdfqwerty
> asdf123
> df
> ```

Notice how you can access certain methods on the strings. Next, we will examine
each of these lines.

 1. Lines 1-4 initialize variables.
 2. Line 5 prints `s1`.
 3. Line 6 prints the length of `s2`. This is interesting as it is a method
    call, not just a value. You can access properties of objects with the `.`
    operator. We will talk more about this later.
 4. Line 8 concatenates `s1` and `s2`. Concatenation is when you put things
    together. Thus, the result of the expression `s1 + s2`, or `"asdf" +
    "qwerty"`, is `asdfqewrty`. This is useful for many things. The `+` operator
    for strings can be thought of as a shortcut for the `concat` method.
 5. Line 9 concatenates `s1` and `v1`. This shows how you can concatenate
    strings with any value. Note that this does not only work with primitives,
    you can also put any object in the place of `v1`. This calls a special
    method inherited from `Object`, `toString`, that gives a string
    representation of the object. We will talk more about this later. With
    primitives, the string just forces the value into a readable form.
 6. Line 10 uses another method on strings, `substring`. This just shows how
    `String`s are full objects, not like the primitive values.

### Characters

Strings can be thought of as sequences of characters. The representation of
characters in Java is a `char`. Thus, a string is a sequence of `char`s. The
Unicode standard makes characters not necessarily representable by a single
`char`, but we will ignore this for now. For now, all characters in the English
alphabet are representable by a single `char`, along with many special
characters.

To get a character from a string, use the method `charAt`. Thus,
`"asdf".charAt(1)` will give `'s'`. Wait, what? To understand this, you must
first know that certain values in Java use 0-based indexing, rather than the
typical 1-based indexing. This means that the first character in a string would
be at index 0, not index 1. Thus, to get the first character of the string, you
would write `str.charAt(0)`. To get the last character, you would write
`str.charAt(str.length - 1)`. This might seem strange and counter-intuitive, but
it is actually rather useful. We will see some nice use cases for this later.

# TODO: Consider whether these are necessary

### String Interpolation

When writing strings, it may be difficult or tedious to write `"v1 = " + v1 ",
v2= " + v2 ...` for all of your values. 

### String Builder
