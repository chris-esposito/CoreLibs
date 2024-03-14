---
layout: default
---
# CoreLibs_SelectorFactory

Factory class for producing selectors to allow decoupling of construction
and utilization


**Author** Tom Wilkins


**Group** Data

## Methods
### `public CoreLibs_BaseSelector create(Type selectorType)`

Creates the selector established by the provided type and casts it to a selector. Will throw a runtime exception if the type provided is not a concrete selector class

---
