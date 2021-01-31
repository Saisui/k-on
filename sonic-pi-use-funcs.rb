def pl ss, *a
    case ss
    when Array
      ps = ss.map{|p| p+TONE}
      play(*(ps+(a||[])))
    when Numeric
      ps = ss+TONE
      play(*([ps]+(a||[])))
    end
end