# iOC

A simple iOC container written in Swift.

## General Idea

The basic design of an iOC is to allow registration and resolution of types.

## Considerations

- API design
    - Registration
    - Resolution
    - Dependency resolution (for cyclic deps)
- Multiple Registrations
    - For the purposes of this exercise I'm allowing only a single registration of any given type, however in a more complete example it would make sense to allow for multiple registrations using a unique identifier of some kind
- Circular dependency resolution
    - If we use a closure based registration, we can support manual resolution 
- Lifecycle
    - Given the timeframe, I'll limit support to transient (unique instance) types only
- Nesting
    - For simplicity I won't be supporting nesting.
    - In a more complete example it would make sense to allow for some more structure so that different parts of the app gain additional deps while keeping other parts of the app from having access.
- Metadata
    - Its common to allow metadata  (e.g. userInfo) to be passed during resolution, for the purposes of this exercises I won't be implementing this
- Error Handling
    - For simplicity I'll also be ommiting error handling. Various approaches could be considered in a more complete example, e.g. try/optionals
- Thread Safety
    - To keep things simple I won't implement any locking mechanisms.
    - In a more complete example it would be important to consider the thread safety
