using Plots
using Printf

C(n, k) = binomial(BigInt(n), BigInt(k))

function p(wins, n, t, z)
    N = t*n
    C(n,wins) * C(N-n,z-wins) / C(N,z)
end

# println(p(0, 10, 100, 10))
# println(p(1, 10, 100, 10))
# println(p(2, 10, 100, 10))

function patleastkwins(wins, n, t, z)
    pcumulative = 0
    for i in 0:wins-1
        pcumulative += p(i, n, t, z)
    end
    return 1 - pcumulative
end

# println(patleastkwins(1,10,100,10))

# Plot 1
default(fontfamily = "Times")
x = ["wins=0", "wins=1", "wins=2", "wins=3"]
# n = 1
y1 = p.([0, 1, 2, 3], 1, 100, 10)
# n = 10
y10 = p.([0, 1, 2, 3], 10, 100, 10)
# n = 100
y100 = p.([0, 1, 2, 3], 100, 100, 10)

ann1 = [text(@sprintf("%10.4f", val), :center, :bottom, font("Times", 9)) for val in y1]
ann10 = [text(@sprintf("%10.4f", val), :center, :bottom, font("Times", 9)) for val in y10]
ann100 = [text(@sprintf("%10.4f", val), :center, :bottom, font("Times", 9)) for val in y100]

plot(layout=(3,1))
bar!(x, y1, label="n=1", subplot=1, series_annotations=ann1)
bar!(x, y10, label="n=10", color=:red, subplot=2, series_annotations=ann10)
bar!(x, y100, label="n=100", color=:green, subplot=3, series_annotations=ann100)

plot!(size=(500,600))
ylabel!("Probability")
# xlims!(first(x) ,last(x))
ylims!(0.0, 1.0)
savefig("meatraffleplot1.png")
savefig("plot.pdf")

# # Plot 2
# default(fontfamily = "Times")
# x = 1:100
# y = p.(0, x, 100, 10)
# plt = plot(x, y)
# plot!(size=(500,400))
# plot!(legend=false)
# xlabel!("n (numbers per ticket)")
# ylabel!("Probability of winning no trays")
# xlims!(first(x) ,last(x))
# ylims!(0.89, 0.91)
# savefig("meatraffleplot2.png")
# savefig("plot.pdf")
