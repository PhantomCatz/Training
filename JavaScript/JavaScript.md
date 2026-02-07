JavaScript
==========

## Introduction

JavaScript is the main language used in web browsers to execute website code. It
can be used to manipulate the page the user sees on a website and interact with
the servers of the site. The WebDev subteam uses it for its 

Because JavaScript is so widespread, most major browsers should allow you to
execute JavaScript directly from within your browser. Thus, you will likely not
need to have a special editor for running JavaScript, so you could use any
editor that has basic support for its syntax, such as Vim or VS Code.

## Basics

As stated previously, you can write and execute JavaScript (Javascript, JS)
directly from the browser. You can do so by opening the *console*, which should
be a feature of every major browser. For most browsers, you can open it by
pressing F12, or using the right-click menu (You may have to press the 'fn'
(function) key along with F12). 

For example, in Firefox, pressing **F12** will immediately open the console. You
can also right click, and select **Inspect**.

![Right click menu of Firefox. The bottom item is circled, which states
'Inspect'.](../Images/Javascript/FirefoxContextMenu.png)

Clicking this will open the **Inspector**, which is a tab in the Developer Menu.
This menu holds many things useful to us, but what we are interested in right
now is the **Console**. Selecting this will bring you to a screen like this:

![Developer menu, with the 'Console' tab
selected.](../Images/Javascript/FirefoxDeveloperMenu.png)

You are now able to execute JS code. You will not need need anything else for a
while, but you may want to save all of your code in a directory somewhere.

## Printing

The first thing you should learn to do in JS is how to output information from
the program. Type the following line into the console and press 'Enter'.

> ```Javascript
> console.log("Hello, world!")
> ```

Your screen should then show something like this:

![Console output after running the given
command.](../Images/Javascript/HelloWorldConsoleOutput.png)

Aside from showing the line you just typed, there are also two other lines:
`Hello, world!`, and `undefined`. From now on, instead of images, the console
will be shown like this, which is equivalent to the previous image:

> ```Javascript
> console.log("Hello, world!")
> 
> > Hello, world!
> 
> < undefined
> ```

Lines that do not start with anything are what you input into the console. The
lines that start with an arrow ('<' or '>') are what the program outputs.

For now, we should focus on the lines that have a forward arrow ('>') in front
of them. This is the text that is printed by the program. We will learn more
about the other part later. For this program specifically, the part we should
focus on would be the line that is

> ```
> > Hello, world!
> ```

The effect of the code you had written previously is that the text 'Hello,
world!' is written, or *logged*, to the console. With this, you can see that the
program ran successfully.

Just looking at what you wrote, and the output it produced, you might be able to
tell that the program will log whatever is between the double quotes ('"'). If
you try to change the quoted text and execute the new code, you will see that
this is, indeed, the case.

> ```Javascript
> console.log("asdf")
>
> > asdf
>
> < undefined
> ```

You can now log any text that you want. You should finally know that you can end
the line with a semicolon (';') and press Shift+Enter to start a new line in the
console. Doing so allows you to write multiple print statements.

> ```Javascript
> console.log("foo");
> console.log("bar");
>
> > foo
> > bar
>
> < undefined
> ```

The double-quoted text is called a *string*. We will learn more about strings
later. You should just remember that the double quotes do not apply to text over
multiple lines. Thus, 

> ```Javascript
> console.log("as
> df")
> ```

is not valid code. If you want to print multiple lines, you should just use
multiple print statements.

## Variables

When writing a program, you will inevitably need to reuse and store information.
JS lets you store information in *variables*, to which you can refer later in
the program to use the information. For example:

> ```Javascript
> let foo = "asdf";
> console.log(foo);
> console.log(foo);
>
> > asdf
> > asdf
> 
> < undefined
> ```

The first line creates a variable named 'foo', while the next two lines print
out the *contents* of foo. In this manner, the string 'asdf' is used multiple
times, rather than having to repeat it. For longer texts, or text that is used
frequently, it would be easier to assign it to a variable than to write it
multiple times.

You may have learned in mathematics about variables, but the ones in programming
are a bit different. In math, a variable is a known object with an unknown,
constant value. In programming, a variable is also a known object, but you can
assign it a value. Typically, variables will also be *mutable*, or changeable.
This means that you can have a variable, say 'a', be the value 'foo' at one
point, but be 'bar' at another point.

Suppose you are a worker (unpaid) in a large factory warehouse. There are many
boxes inside this warehouse. If you were to put some apples in a box, then there
would definitely be a box of apples in the warehouse. However, people may not
know where the box is. Thus, you attach an ID label to the box, allowing you and
other people to find the box. You can easily attach another label to the box,
making two IDs refer to the same box. Moreover, you can remove your label and
attach them to another box, perhaps one with oranges. Then, you would have a
label for apples attached to an orange box.

This example shows an abstraction of the program. The factory warehouse would be
the computer's memory. The boxes represent the different data in use by the
program. You can think of the labels as variables. A 'variable' in programming
is not the data itself, it merely holds a reference to the data. It can easily
be changed to refer to different data without destroying the original data.
Other variables can also easily refer to the exact same data, instead of just
copies of it.

> Note: This description of variables is only for certain languages, such as
> JavaScript. You may have a different experience with other languages, but this
> explanation is closer to how JS works.

This example also shows the importance of correctly naming your variables. The
label that was originally for apples was moved to refer to a box of oranges.
This is lying to those who read it, as people who do not know the data (the
insides of the box) would think that the box held apples. Thus, you should
always name your variables properly. Your variables should also have descriptive
names. Looking at the previous example, 'foo' is not descriptive. Perhaps a
better name would be 'exampleString'. You should refer to the Coding Standards
document to name your variables.

### Reassigning variables

As shown, you can reassign your variables to refer to a different value. This is
simply done by writing the variable name, followed by '=', followed by its new
value. Note that this is just the previous statement, but without the 'let'
word.


> ```Javascript
> let foo = "asdf";
> console.log(foo);
> foo = "hjkl";
> console.log(foo);
>
> > asdf
> > hjkl
> 
> < undefined
> ```

You can see that, at first, 'foo' was equal to the string 'asdf', but it later
changed to be 'hjkl'. This is called *assignment*, or *reassignment*. When
written with a 'let', it is called *declaration*, as we 'declare' that the
variable exists. Before we declare a variable, we cannot use it. (Note: there is
more to this, but the explanation is not necessary for now. This is a feature of
[strict mode](
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode).
You may learn more about this on your own, if desired.)

### Constants

Sometimes, the ability to rewrite the data of a variable is not desired. For
example, you may have very important data stored somewhere, which you know will
not change.

You can make a variable constant by using the keyword `const` instead of `let`.
This will make it so that you cannot reassign the value of that variable, so it
keeps its value from when you declared it.

> ```Javascript
> const foo = "asdf";
> foo = "hjkl";
> ```

This code would give an error, stating that you cannot assign to the constant.
Constants are useful for values that you know will not change, but are
frequently used. They tell the other programmers who look at your code that you
want that value to stay the way it is. For example:

> ```Javascript
> const SEPARATOR = "==============================";
> console.log(SEPARATOR);
> console.log("asdf");
> console.log(SEPARATOR);
> console.log("hjkl");
> console.log(SEPARATOR);
> 
> > ==============================
> > asdf
> > ==============================
> > hjkl
> > ==============================
> 
> < undefined
> ```

This example is rather contrived, but constants are, in fact, very useful and are
used frequently in the WebDev codebase.

## Numbers, Mathematics

### Numbers

JavaScript has support for numbers, which you can access by writing a number as
you would anywhere else.

> ```Javascript
> 3.14
> 
> < 3.14
> ```

You may notice that, although there is no text printed, the bottom line no
longer says `undefined`, but `3.14`. This is because this is the *evaluation* of
the last line of the program. As it turns out, the evaluation of `3.14` is
`3.14` (·◇·).

You can write numbers in exponential form as well. The following are all valid
numbers in JS.

> ```Javascript
> 1
> 01
> -1
> 0.1
> .1
> 1e2
> 0.01E1
> 1e-1
> ```

These numbers are 'double precision floating-point', which means that the cannot
model every number exactly. They are limited to around 15 decimal digits of
precision, and they cannot be larger than around `1.797e308`, or smaller than
around `-1.797e308`.

TODO: write about bigints

### Mathematics

You can perform mathematical operations on the numbers in JS. Most of these
would be pretty intuitive.

> ```Javascript
> console.log(1 + 2);
> console.log(1 - 2);
> console.log(1 * 2);
> console.log(1 / 2);
>
> > 3
> > -1
> > 2
> > 0.5
>
> < undefined
> ```

You can see that the operations are, in order, addition, subtraction,
multiplication, and division. The operators (+, -, *, /) are written between the
numbers, as is standard in mathematics. These operators will work for both the
standard numbers and the bigints, but note that you cannot mix the numbers and
the bigints (i.e. `1 + 2n` is not valid). However, there are a few more
operators that you may not be used to:

1. '`%`' Modulo operator

   This operator gives the remainder of a division. For example, `7 % 2` would
   be `1`, as 7 = 2*(3) + **1**. This is not *exactly* the same as modular
   arithmetic in mathematics, as `(-7) % 2` would give `-1`, not `1`. 

1. '`++`' and '`--`' Increment and decrement

   These operators increment and decrement a variable *in place*. This means
   that you can increment/decrement a variable `x` by doing `x++` or `x--`,
   respectively. After this, the variable `x` would be 1 greater/less than it
   was before. This is just a shortcut to writing `x=x+1` or `x=x-1`, though.

1. '`|`' Bitwise OR

   The following few operations are all *bitwise*, and their usage is rather
   rare for our purposes. Their explanations may be hard to understand, so you
   may skip them if you so desire.

   This takes each number, converts it into their binary form, and performs OR
   on each corresponding bit pair to get the output. For example,

   ```
   9  = 1001
   4  = 0100
   ---------
   13 = 1101
   ```
   
   so `9 | 4` is `13`, as (0 OR 0) = 0 and (1 OR 1) = (1 OR 0) = (0 OR 1) = 1.
   In a table,

   > ```
   >  | 0 1
   > ------
   > 0| 0 1
   > 1| 1 1
   > ```

   This and the other bitwise operations only work for integers, and, if you try
   to use values with a fractional part, the fractional part will be
   *truncated*, or dropped. Thus, you should make sure that the values used can
   only be integers.

1. '`&`' Bitwise AND

   This performs bitwise AND on the operands. For example,

   ```
   15 = 1111
   9  = 1001
   ---------
   9  = 1001
   ```

   so `15 & 9` is `9`, as (0 AND 0) = (0 AND 1) = (1 AND 0) = 0 and (1 AND 1) =
   1.

   > ```
   >  | 0 1
   > ------
   > 0| 0 0
   > 1| 0 1
   > ```

1. '`^`' Bitwise XOR
   
   This performs bitwise XOR on the operands. Note: This is **not**
   exponentiation.

   > ```
   >  | 0 1
   > ------
   > 0| 0 1
   > 1| 1 0
   > ```

1. Bitwise NOT

   This is an operator that works on a single number. It applies binary NOT to
   each of the bits of the operand.

   JS uses the two's complement representation of integers. This means that 
   TODO: finish explanation

1. '`**`' Exponentiation

   As in standard math, this raises the first argument to the power of the
   second. For example, `3 ** 2` is `9`.

   This works with any two numbers. For example, 

   > ```Javascript
   > 1.1**-0.97
   >
   > < 0.9116939973697157 
   > ```

These have a specific precedence (ranking for evaluation order), but you can use
parentheses to force the order of evaluation of the operators. Thus, you do not
have to memorise the order of the operators.

TODO: see if more need to be added

## Strings

### Concatenation

You saw before how you can print strings with `console.log`. You only
learned how to print simple strings, but it is possible to combine strings to
make longer pieces of text.

> ```Javascript
> let name "Foo";
> console.log("Hello, " + foo);
> 
> > Hello, Foo
>
> < undefined
> ```

As you can see, you can combine strings with '`+`'. This 'adds' the string on
the right to the string on the left, which is called *concatenation*. You can
concatenate more than just strings, however. For example,

> ```Javascript
> console.log("1 + 1 = " + (1 + 1));
>
> > 1 + 1 = 2
>
> < undefined
> ```

You can see that you can also concatenate numbers with strings. This also works
the other way (`1 + "a"` is `"1a"`). This will actually work with anything, so
you can always add something to a string to show a representation of it.

Finally, you should note the use of parentheses in this example. The '`+`'
operator will be evaluated left-to-right, so everything added to the string will
be concatenated. You have to force the evaluation of the expression `1 + 1` to
occur before it is concatenated with the string.

### String Template Literals

Using the previous method for concatenation is fine, but it can get tedious when
you are trying to put multiple values in a string. For example, displaying 3
variables could take *5* concatenations:

> ```
> "v1=" + v1 + ", v2=" + v2 + ", v3=" + v3
> ```

An easier way to do this would be to use *template literals*. A *literal* is a
textual representation of a value as it is written in source code. A normal
string literal is just text surrounded by quotes (`"text"` or `'text'`). A
number literal would be text like `10` or `3.14`.

A template literal is text surrounded by backticks (`` `text` ``). There are a
few useful things about using these.

 * You can put quotes or double quotes inside these strings without having to
   escape them.

 * These strings can span multiple lines. Thus, you could write
   
   > ```Javascript
   > let foo = `asdf
   > lakjsdfhl
   > lasjkdfhalsdfh
   > `;
   >
   > < undefined
   > ```

 * These strings allow you to *interpolate* values. For example,
   
   > ```Javascript
   > `1 + 1 = ${1 + 1}`
   >
   > < "1 + 1 = 2"
   > ```

   You can see that the string evaluated the expression `1 + 1`, allowing you to
   put the expression inside of the string without having to concatenate it. You
   can put any expression inside of a template literal by using `${expr}`. You
   could use these strings, for example, to make a debugging statement by
   writing
   
   > ```Javascript
   > let asdf = 1;
   > console.log(`asdf=${asdf}`);
   >
   > > asdf=1
   >
   > < undefined
   > ```

TODO: finish??


## Conditional Statements

### Boolean Values

A boolean value is one of two values: 'True' or 'False'. Booleans represent a
logical statement, with the idea that every statement is either true or false.
For example, the statement `1 < 2` would be true, while the statement `2 < 1`
would be false.

There are a few operators you can use that return a boolean:

 * `==`

   This operator compares two values for equality. There are two equals signs
   because one would signify assignment. For example, `1 == 1` is true, while
   `"foo" == "bar"` is false.

 * `!=`
   
   This operator is 'not equals', evaluating to true when the operands are not
   equal (It kind of looks like a slash going through the equals-sign). Thus,
   `1 != 1` is false, while `"foo" != "bar"` is true.

 * `<`, `<=`, `>`, `>=`

   These operators are for comparison. Like in math, `<` and `>` test for strict
   less/greater than, while `<=` and `>=` also are true for equality. For
   example, `1 < 2` is true, `1 < 1` is false, and `1 <= 1` is true.

   These operators also work on strings, comparing them alphabetically. Thus,
   you can do things like `"a" < "b"` (which would evaluate to true).

 * `!`

   This operator negates a boolean `!true == false`, `!false == true`

 * `||`, `&&`

   These operators are logical OR and logical AND. In truth tables,

   OR:
   ```
    | F T
   -+-----
   F| F T
   T| T T
   ```

   AND:
   ```
    | F T
   -+-----
   F| F F
   T| F T
   ```

### If/else statements

To write effective programs, you need to have *conditional statements*,
statements that only run when a certain condition is met. You can represent the
condition with booleans, and you can make part of your program run when the
condition is met using *`if` statements*.

Here is an example program:

> ```Javascript
> let v = 1;
> if(true) {
>   v = 2;
> }
> if(false) {
>   v = 3;
> }
> console.log(v);
>
> > 2
>
> < undefined
> ```

As you can see, the code inside of the first if block (the code inside of the
curly braces) runs, but the code inside of the second block does not run. This
is because the first if statement has a true condition, while the second block's
condition is not true. By combining the boolean expressions with the if
statements, you can make complex code.

For example, if you applied names to the previous example,

> ```Javascript
> let robotState = STOPPED;
> if(robotIsRunning) {
>   robotState = RUNNING;
> }
> if(robotIsDisabled) {
>   robotState = DISABLED;
> }
> console.log(robotState);
> ```

<!-- idk-->

### Truthy/Falsy Values

In JavaScript, values have an inherent boolean value. Thus, you can write code
like this:

> ```Javascript
> let a = 0;
> let b = 1;
>
> if(a) {
>   console.log("a");
> }
> if(b) {
>   console.log("b");
> }
>
> > b
>
> < undefined
> ```

In Javascript, most values are *truthy*, acting as `true` in a boolean
statement.

 * `false`
 * `0`
 * `0n`
 * `""`
 * `undefined`
 * `null`

