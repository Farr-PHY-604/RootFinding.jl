module RootFinding

export bisect_root, secant_root

function bisect_root(f, a, b; rtol=1e-8, atol=1e-8)
    fa = f(a)
    fb = f(b)

    @assert fa*fb < zero(fa)

    while abs(a-b) > atol + rtol*(abs(a) + abs(b))/2
        m = (a + b)/2
        fm = f(m)

        if fa*fm < zero(fa)
            fb = fm
            b = m
        else
            fa = fm
            a = m
        end
    end

    return (a+b)/2
end

function secant_root(f, a, b; rtol=1e-8, atol=1e-8)
    fa = f(a)
    fb = f(b)

    @assert fa*fb < zero(fa)

    # Secant guesses and function values:
    sg0 = a
    sg1 = b
    sf0 = fa
    sf1 = fb

    while abs(sg1-sg0) > atol + rtol*(abs(sg0) + abs(sg1))/2
        sg = sg0 - sf0*(sg1-sg0)/(sf1-sf0)

        if sg < a || sg > b
            m = (a+b)/2
            fm = f(m)

            if fm*fa > zero(fa)
                a = m
                fa = fm
            else
                b = m
                fb = fm
            end

            sg0 = a
            sg1 = b
            sf0 = fa
            sf1 = fb
        else
            sg0 = sg1
            sf0 = sf1
            sg1 = sg
            sf1 = f(sg)
        end
    end

    return sg1
end



end # module
