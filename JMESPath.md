## JMESPath

JMESPath is a query language for JSON.
The official documentation, guides, and specifications for JMESPath:

-   [JMESPath Official Website](https://jmespath.org/)

Test and experiment with JMESPath queries in a user-friendly interactive environment:

-   [JMESPath Interactive Editor](https://play.jmespath.org/)

# JMESPath Wildcard Syntax

**JMESPath** is a query language for JSON, offering powerful wildcard syntax to handle arrays and objects efficiently. Below is a guide to its wildcard capabilities.

## Wildcard for Arrays: `[*]`

The `[*]` wildcard selects all elements in an array.

**Example**:

```json
{
    "fruits": ["apple", "banana", "cherry"]
}
```

Query:

```jmespath
fruits[*]
```

Result:

```json
["apple", "banana", "cherry"]
```

---

## Wildcard for Objects: `*`

The `*` wildcard selects all values in an object.

**Example**:

```json
{
    "name": "John",
    "age": 30,
    "city": "New York"
}
```

Query:

```jmespath
*
```

Result:

```json
["John", 30, "New York"]
```

---

## Combined Wildcard in Nested Structures

Wildcards can be combined to traverse nested structures.

**Example**:

```json
{
    "items": [
        { "id": 1, "name": "item1" },
        { "id": 2, "name": "item2" }
    ]
}
```

Query:

```jmespath
items[*].name
```

Result:

```json
["item1", "item2"]
```

Wildcard in Filters
Wildcards can also work with filters to conditionally process elements.

Example:

```json
{
"products": [
{"name": "pen", "price": 1.2},
{"name": "notebook", "price": 2.5},
{"name": "eraser", "price": 0.5}
]
```

Query:

```jmespath
products[?price > `1`].name
```

Result:

```json
["pen", "notebook"]
```

**Key Notes**
Use `[*]` for arrays and `*`for objects.
Combine wildcards with functions or filters for more complex queries.

Tags[?Key==\`Project\`] | [0].Value
