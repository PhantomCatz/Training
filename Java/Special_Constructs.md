2: Special Constructs
=====================

When running any program, you must do certain actions based on conditions,
repeat actions multiple times, or, in general, do things that cannot be
determined completely at the time you write the program. Thus, certain
constructs allow you to make the program able to do more.

## 2.1: If, else statements

To run a statement based on a condition, use the `if` construct. Consider the
following code:

> ```Java
> if(1 + 1 == 2) {
>     System.out.println("a");
> else {
>     System.out.println("b");
> }
> ```

Before anything is explained, what do you think this means? It should print `a`
if `1 + 1` is equal to `2`, otherwise it would print `b`, right? Let's examine
each line separately.

1. There are two parts to this line: the `if`, and the expression inside the
   parentheses.
   * The `if` statement runs a statement or group of statements if its condition
     is true. The only block that it runs is the part inside its braces. This
     block is known as a branch, as the program can take a different path
     depending on the condition.
   * The expression inside is a boolean expression, the condition of the `if`
     statement. We will talk more about this later. For now, boolean expressions
     can just be thought of as something evaluating to either true or false.
2. This line prints out `a`, signalling that the first branch has run.
3. The else statement only runs its branch if its corresponding if statement is
   false.
4. This line prints out `b` to signal that the else branch has run

You can see how programs can become much more complex when using this. But, what
kind of conditions (boolean expressions) can you make? We will explore this
next.

## 2.2: Boolean Expressions

A boolean value is either '`true`' or '`false`'. This can be thought of as logic, but
while some logic theories allow for an intermediate or undeterminable value,
there is no such thing in boolean logic. Every statement must evauate to one of
these options.

The boolean operators are `==`, `!=`, `!`, `&&`, `||`, and `^`.

1. '`==`' tests for equality. Thus, `true == false` is `false`, and
`false == false` is `true`. This is equivalent to iff in boolean logic.
2. '`!=`' is 'not equals'. This is just the negation of equality.
3. '`!`' inverts a value, changing `true` to `false` or vice versa.
4. '`&&`' is logical and, which is true if and only if its two arguments are
   true. Thus, `true && true` is true, but none of `true && false`, 
   `false && true`, and `false && false` are true.
5. '`||`' is logical or, which is true if any of its two arguments are true.
6. '`^`' is logical xor (exclusive-or), which is true if exactly one of its
   arguments is true.

The results of this is shown in the table below. For brevity, 0 represents
`false` and 1 represents `true`.

| `a` | `b` | `a == b` | `a != b` | `a && b` | `a` \|\| `b` | `a ^ b` |
|:---:|:---:|:--------:|:--------:|:--------:|:------------:|:-------:|
| `0` | `0` |    `1`   |    `0`   |    `0`   |      `0`     |   `0`   |
| `0` | `1` |    `0`   |    `1`   |    `0`   |      `1`     |   `1`   |
| `1` | `0` |    `0`   |    `1`   |    `0`   |      `1`     |   `1`   |
| `1` | `1` |    `1`   |    `0`   |    `1`   |      `1`     |   `0`   |

| `a` | `!a` |
|:---:|:----:|
| `0` |  `1` |
| `1` |  `0` |

Note that xor is the same as not equals. However, it is easier to understand
xor, so please use this if not not using it for the next purpose shown.

## 2.3: Comparison Operators

Although these operators allow you to do any logic required, it is not currently
useful for anything but pure logic. These next operators allow you to relate
other values with each other to give a boolean value.

There are a few operators you can use: `==`, `!=`, `<`, `>`, `<=`, and `>=`.

These operators may be familiar from math. For completion, the purposes of these
are listed below.

1. `==` tests values for equality.
2. `!=` is the negation of equality.
3. `<` tests whether the first value is less than the second.
4. `>` tests whether the first value is greater than the second.
5. `<=` tests whether the first value is less than OR equal to the second.
6. `>=` tests whether the first value is greater than OR equal to the second.

All of these operators are used infix, i.e. between the operands, like `a R b`
for an operator `R` from this list and compatible values `a` and `b`. They all
give a boolean value.

From this list, you can see that the equality operators between boolean values
is not a special operator, it just compares the boolean values directly. Note
that comparing boolean expressions with constants is rather useless. For
example, `a == true`, for a boolean expression `a`, has the same value as the
expression `a`. `a == false`, or `a != true`, is the same as `!a`. Try to avoid
needless complexity. These operators are still usefull when comparing
expressions with each other, though.

Using these, you can make comparisons such as `x >= 3` or `y != x` to make
decisions in your code.

As a running example, we will consider turning an integer between 0 and 10 into
a word representation of it, like turning `0` into `"zero"`. Since we have not
considered user input yet, we will just suppose that the input has been stored
in the variable `input` that has the type of `int`.

### Example

First, we will have to make sure that the input is in bounds. This is a common
feature you have to make, ensuring that you are not given illegal values, or
handling special cases separately.

> ```Java
> if(input <= 0 || input >= 10) {
>     System.out.println("Input out of bounds. Please input a value between 0"
>      + " and 9 (inclusive)");
> }
> ```

Note that the condition did not require parentheses around the comaprisons. This
is due to the precedence of the operators. For now, you just need to know that
aside from the equality operators, the operations on booleans occur after
evaluating the comparison oeprators. Furthermore, logical or(`||`) occurs after
logical and(`&&`).

Due to line length limits, the string is broken midway through.

Now, we have to do the rest of the logic if the input is valid, that is, the
first condition shown is not true.

> ```Java
> if ...
> } else {
>     // do logic
> }
> ```

This 'do logic' part should select a word based on what the number is. For now,
we will just use this:

> ```Java
> if(input == 1) {
>     System.out.println("One");
> } else if(input == 2) {
>     System.out.println("Two");
> } else if(input == 3) {
> ...
> }
> ```

Putting it all together, the program looks like this:


> ```Java
> if(input <= 0 || input >= 10) {
>     System.out.println("Input out of bounds. Please input a value between 0"
>      + " and 9 (inclusive)");
> } else {
>     if(input == 1) {
>         System.out.println("One");
>     } else if(input == 2) {
>         System.out.println("Two");
>     } else if(input == 3) {
>         System.out.println("Three");
>     } else if(input == 4) {
>         System.out.println("Four");
>     } else if(input == 5) {
>         System.out.println("Five");
>     } else if(input == 6) {
>         System.out.println("Six");
>     } else if(input == 7) {
>         System.out.println("Seven");
>     } else if(input == 8) {
>         System.out.println("Eight");
>     } else if(input == 9) {
>         System.out.println("Nine");
>     }
> }
> ```

Although this program works for all numbers in bound, it is hard to write and
there is a lot of repeated code. We will now explore ways to make this program
more robust and extendible.

## 2.4: Switch, Case

You may notice that the second branch of the first `if` statement contained many
tests for equality of one this, doing something else for each one. This usage is
so common, it is made into a special construct in languages like Java. This
construct is called a switch.

Turning the previous code into a switch looks like this:

> ```Java
> switch(input) {
> case 1:
>     System.out.println("One");
>     break;
> case 2:
>     System.out.println("Two");
>     break;
> case 3:
> ...
> }
> ```

The argument of the switch is what is compared to all the other values. The
cases are the possible options for the value to be. Due to the way the switch is
implemented, the cases can only have constant expressions. This means that they
cannot depend on ther variables
