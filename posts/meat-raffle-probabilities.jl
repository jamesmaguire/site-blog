# C(n, k) = factorial(big(n))/(factorial(big(k))*factorial(big(n-k)))
C(n, k) = binomial(BigInt(n), BigInt(k))

println(C(100-1,10) / C(100,10))

println(C(1000-10,10) / C(1000,10))
println(C(10,1) * C(990,9) / C(1000,10))
println(C(10,2) * C(990,8) / C(1000,10))
