Java
====
 
 - Printing
 - Variables, constants, assignments
 - Numbers, math operators
   - Ints, floats
 - Types
 * Strings
   - Characters
   - Concatenation
   * Interpolation
   * StringBuilder
 * If, else
   * Boolean expressions
 * Switch, case
 * For, while
   * For each
 * Arrays
 * Functions
   * Returning, early exit
   * Anonymous functions
   * Recursion
 * Objects
   * instanceof
 * Imports, exports
 * Classes
   * Constructors
   * Fields
   * Access modifiers
     * Static
   * Methods
   * Wrapper classes
   * Inheritance
     * Abstract
     * Interfaces
 * Errors, try/catch/finally
   * Checked/unchecked exceptions
   * Try with
 * File io
 * Generics
   * Functions
   * Classes
   * Tuples
 * Design Patterns
   * Strategy
   * Factory
  + Singleton
 + Enums
 + Records
 * Collections
   * ArrayList
   * LinkedList
   * Map
     * Hash, Tree
   * Set
     * Hash, Tree
   * Queue
   * Stack

JavaScript
==========
 
 * Printing
 * Variables, constants assignments
 * Numbers, math operators
   * Number (Ints, floats), big ints
 * Strings, methods on strings
   * Concatenation
   * Interpolation
 * Arrays
 * Objects
   * Null/undefined
 * If, else
   * Boolean expressions
   * Truthy/falsy values
 * For, while
 * Switch, case
 * Functions
   * Returning, early exit
   * Anonymous functions
 * Modules
   * Imports, exports
 * Errors, try/catch/finally
 * Async, await
 * Builtin functions
   * alert

Typescript
==========

 * Types
 * Interfaces
 * Functional types
 * Union types
 * Object types (permitted keys)

HTML, CSS
=========
 
 * Making basic web page
 * Styling
 * Event listeners
 
React
=====
 
 * Making elements
 * Functional components
 * State (useState)
 * Effects (useEffect)
 * Using elements
   * HTML
   * Importing custom elements
   * Properties
 * Repeating elements
   * Arrays
     * `key` property
   * Functional components
 * Custom elements
   * Tabs
   * Flex
   * Input fields (look at current code)


Coding Standards
================
 
 * Naming
   * Variables cannot be 1 letter unless for indices
     * Math should use descriptive names, even for things one may want to call `x`
     * Boolean values should be similar to a question
   * Normal variables, method names should be lowerCamelCase
   * Constants, enum members should be SCREAMING_SNAKE_CASE
   * Classes, enums, record names should be UpperCamelCase
   * File names should not start with `Catz`, should be descriptive with names
   * Variables should not contain an identifier that represents their structure,
    e.g. kConst for a constant
   + FeedForwardCharacterization.java - voltageConsumer
   * Do not name variables for their type, e.g. `intValue`
   - Rather than naming a variable `timeInSeconds`, consider using a `TimeSpan`
    object, and use similar judgement for other situations
   * One should not need to ask what a variable represents
   * Abbreviations should not be made if they take away 2 characters or less, or
    they make the name less than 4 characters
     * All abbreviations of a word should be the same
     * An exception can be made for words that are very widespread, completely
     unambiguous, and do not stand alone 
   * Words should be spelled correctly
 * Standard indentation
   * All tabs
   * 1 tab = 4 spaces
   * Braces on same line as construct
   * Case one level indented from switch
   * Space between if, for etc. and opening parentheses
 * Function length
   * Not more than 60 lines
   * Abstraction for longer, unless absolutely necessary
   * Functions should not have more than {5/6} indents TODO: FINALIZE
 * Maximum line length
   * Try 100, 120, then 80
 * Documentation
   * All classes must have a javadoc describing their purpose
   * Private methods are optional
   * Public methods must have them
   * Overridden methods are optional, must have it at least in base class
 * Breaking expressions
 * File structure
 * Argument list
 * Function scoping
   * Methods can only use passed-in parameters
   * Classes using fields should specify `this`, static references should specify
    the class
 * If a block needs comments to explain what is happening, consider
   restructuring the function to make it more clear. Note that comments are
   different from documentation
 * Constructs
   - Make hard limits on loop lengths
     * CatzMathUtils - placeInAppropriate0To360Scope
   * Switches must have a default value
   * If blocks spanning to the end of the method should either have subblocks
    moved into separate functions or changed to early exits
   * Enum members should be used inside switches only
     * Only exception is if enum is compared against one value, only once. Then, a
     single `if` statement is permittable
   * All fields should either be set inside the contructor or be static
     * All fields should set the default value inside the constructor only
     * Public fields without setters should be final
   * Constructs should always surround their block with braces
 * All errors should be caught before main
 * No magic numbers
 * All fields, methods, internal classes should have access modifiers
 * Do not use `var` ever
 * Static imports should not be used
 * Block comments
   *

Git
===

 - Installation
 * GitHub
 - Idea
 - Status
 - Cloning
 * Committing, staging/unstaging
   * Vim lesson???
   - Message
   - Log
   - Amend
   - Reset
 * Branching
   * Stashing
 * Undoing
   * Abort
     * Commit
     * Merge
   * Reset
   * Reflog
 * Fetching
 * Merging
 * Diff/merge conflicts
 * Pushing
 * Conventions/standards
