### ErrorfreeArithmetic: the source files

| file | purpose |
|------|---------|
| ErrorfreeArithmetic.jl | the module realization, includes the others |
| single.jl | provide arithmetic functions of 1 argument |
| double.jl | provide arithmetic functions of 2 arguments |
| triple.jl | provide arithmetic functions of 3 arguments |
| quadruple.jl | provide arithmetic functions of 4 arguments |
| quintuple.jl | renormalization functions of 5 arguments |

#### Notes

Functions that are errorfree tranformations per se are named using the prefix __eft__:  

      eftAdd{T<:Float64}(a::T, b::T)  
          an errorfree transformation for the addition of two Float64 values
          s0,s1 = eftAdd(a,b) ST  abs(s0) > abs(s1)  ∧   ulp(s0) > ufp(s1)
              s0 ⊕ s1  == a + b      and     s0 == s0  ⊞  s1
      eftMul{T<:Float64}(a::T, b::T, c::T)
          an errorfree transformation for the multiplication of three Float64s
          
 Functions that return a tuple of length N where N does not equal the argument count  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 are named using the suffix <lowercase>_AsN_ or <uppercase>_asN_ :  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 eftAddAs2(a,b,c), eftAddGTEas2(a,b,c)
 

Functions that are not errorfree but are as accurate as possible are named using the prefix __acc__:  

      accSqrt{T<:Float64}(a::T)  
          an accurate transformation for the square root of a Float64 value  
          that is not an errorfree transformation (e.g. rounds faithfully).

  
#### Term and Symbol Mneumonics

  __⊕__  is  lossless addition  
  __⊗__  is  lossless multiplication  
  
  __⊞__  is  the usual floating point addition  
  __⊠__  is  the usual floating point multiplication  


  __∧__  is conjunction:&nbsp;&nbsp;&nbsp;&nbsp;  _a_ __∧__ _b_ &nbsp;  __⟺__   &nbsp; both _a_ and _b_ hold true  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  without implying another connection amoung _a_ and _b_  

  __ST__ is such_that:&nbsp;&nbsp;&nbsp;&nbsp;    _a_ __ST__ _A_  &nbsp; __⟺__ &nbsp; _a_ is given and here, _a_ is _A_


      ulp( value::FloatingPoint ) ≜ unit_last_place( value )   
        _the significance of the significand's least significant bit_  
        this is a positive or negative power of two, as it values a single bit [ ulp(0) is 0]  
             ulp(0b1000) == ulp(0b0001) == 2^(0)       ulp(0b10.0000) == ulp(0b00.1111) == 2^(-4)  
                   4210           4210                          1234              1234  

      ufp( value::FloatingPoint)  ≜ unit_first_place( value )   
        _the significance of the significand's most significant bit_  
             this is a positive or negative power of two, as it values a single bit [ ulp(0) is 0]  
             ufp(0b1000) == ufp(0b0001) == 2^(4)       ufp(0b0010.00) == ulp(0b0000.11) == 2^(4)  
                   4210           4210                       4210 12           4210 12  
