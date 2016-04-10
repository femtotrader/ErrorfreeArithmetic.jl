## ErrorfreeArithmetic
errorfree transformations and other arithmetic mappings of like accuracy
```ruby
                                                       Jeffrey Sarnoff © 2016-Mar-22 at New York
```

#### Use
```julia
using ErrorfreeArithmetic

hiPart, loPart  =  eftAdd(   12345.0f0  , 0.12345f0       ) 
showall( (hiPart,loPart) ) # 12345.123f0, 0.00040312856f0

hiPart, loPart  =  eftAdd(   12345.0    , 0.12345         ) 
showall( (hiPart,loPart) ) # 12345.12345, 8.614775559578902e-13

loPart == Float64((big(12345.0)+big(0.12345)) - big(hiPart)) # true


```
