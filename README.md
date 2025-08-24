
# MCFunctionDSL

> _**MCFunctionDSL** is currently in development and liable to change._

**MCFunctionDSL** is a composable Swift **[DSL]( https://en.wikipedia.org/wiki/Domain-specific_language )** capable of compiling down into MCPE's `.mcfunction` files.

## Usage

```swift
struct SpiritsTick: MCFunction {
    var componentBody: some MCComponent {
        Spirit(
            name: "Speed Spirit",
            effect: .speed(3, for: 1),
            spawnEntityType: "allay",
            speed: 0.2,
            movementRange: 5...30,
            effectRange: 10
        )
        
        Spirit(
            name: "Bounce Spirit",
            effect: .jumpBoost(5, for: 5),
            spawnEntityType: "slime",
            speed: 0.15,
            movementRange: 3...25,
            effectRange: 7
        )
    }
    
    struct Spirit: MCComponent {
        let name: String
        let effect: Effect.Effect
        let spawnEntityType: EntityType
        let speed: Double
        let movementRange: ClosedRange<Double>
        let effectRange: Double
        
        var componentBody: some MCComponent {
            Section("Spirit: \(name)") {
                Section("Set Up") {
                    let spawnTarget = TargetSelector.allEntities(.named(name), .typed(spawnEntityType))
                    
                    Execute(.at(spawnTarget)) {
                        Summon(.armorStand, named: name)
                    }
                    
                    
                    Kill(spawnTarget)
                }
                
                Section("Upkeep") {
                    let spirit = TargetSelector.allEntities(.named(name), .typed(.armorStand))
                    
                    Effect(
                        give: .invisibility(1, for: 1),
                        to: spirit,
                        hideParticles: true
                    )
                    
                    Teleport(
                        spirit,
                        to: .position(.forward(speed)),
                        facing: .target(
                            .nearestPlayer(
                                .outside(radius: movementRange.lowerBound),
                                .inside(radius: movementRange.upperBound)
                            )
                        )
                    )
                    
                    Execute(.at(spirit)) {
                        Effect(give: effect, to: .nearestPlayer(.inside(radius: effectRange)))
                    }
                }
            }
        }
    }
}
```

```mcfunction

# Spirit: Speed Spirit
 
 # Set Up
  execute at @e[name="Speed Spirit",type=minecraft:allay] run summon minecraft:armor_stand "Speed Spirit"
  kill @e[name="Speed Spirit",type=minecraft:allay]
 
 
 # Upkeep
  effect @e[name="Speed Spirit",type=minecraft:armor_stand] invisibility 1 1 true
  tp @e[name="Speed Spirit",type=minecraft:armor_stand] ^ ^ ^0.2 facing @p[rm=5,r=30]
  execute at @e[name="Speed Spirit",type=minecraft:armor_stand] run effect @p[r=10] speed 1 3
 


# Spirit: Bounce Spirit
 
 # Set Up
  execute at @e[name="Bounce Spirit",type=minecraft:slime] run summon minecraft:armor_stand "Bounce Spirit"
  kill @e[name="Bounce Spirit",type=minecraft:slime]
 
 
 # Upkeep
  effect @e[name="Bounce Spirit",type=minecraft:armor_stand] invisibility 1 1 true
  tp @e[name="Bounce Spirit",type=minecraft:armor_stand] ^ ^ ^0.15 facing @p[rm=3,r=25]
  execute at @e[name="Bounce Spirit",type=minecraft:armor_stand] run effect @p[r=7] jump_boost 5 5


```

## Pros & Cons

### Cons
- **MCFunctionDSL** is more verbose than it's compilation.
    - This goes both ways, I think, as `.mcfunction` files often suffer from being too dense.


### Pros
- **MCFunctionDSL** is substantially more **[D.R.Y]( https://en.wikipedia.org/wiki/Don%27t_repeat_yourself )** than `.mcfunction` files. Thanks to Swift's Type System, you can—of course—pull every argument out into a seperate, reusable declaration. This is especially useful for reducing **[Target Selector]( https://learn.microsoft.com/en-us/minecraft/creator/documents/targetselectors )** duplication.
    - **Tip:** For extra **D.R.Y.**-ness, ``Execute``'s `run` closure can accept multiple commands. <!-- TODO: Move? -->
- Because of the **modularity** of **MCFunctionDSL**, it's much easier make wide changes abstracted from the `.mcfunction` file.
- Using inbuilt ``MCComponent``s, invalid commands are largely impossible to represent.  
