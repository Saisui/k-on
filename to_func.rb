def op ss,opr, i
    case ss
    when Array
        ss.map{|n| n.send(opr, i)}
    when Numeric
        ss.send opr, i
    end
end

### 上行操作
def u_ ss, i
    op ss, :+, i
end

### 下行操作
def d_ ss,i
    op ss, :-, i
end

### 倒影操作
def invs_ ss,mirl
    ss.map do |n|
        # middle = n-avg
        n - (n-mirl)*2
    end
end

### 模进同一音列
def maki ss,i=1
    ss.map{|n| n%12 }
end

### 变成有向音程行进链
def to_ic ss
    res=[]
    ss.each_with_index do |n, i|
        if i>0
            res << (n - ss[i-1]) 
        end
        res << (ss[0] - ss[-1])
    end
    res
end

### 音程含量
def icv ss
    all=[]
    list = ss.map{|n| n%12 }
    list.size.times do |i|
        ((i+1)..(list.size-1)).each do |j|
            all << (list[j]-list[i])
        end
    end
    bll = all.map{|n| n.abs}
    bes = []
    bll.each do |n|
        k = n%12
        bes << (case k
        when 0..6
            k
        when 7..11
            case  k
            when  7 then 5
            when  8 then 4
            when  9 then 3
            when 10 then 2
            when 11 then 1
            end
        end
        )
    end
    res = []
    (0..6).each do |i|
        res << bes.count(i)
    end
    res
end

### 将音级转化为对应的 MIDI 值, basev 为 首音C
def gm ss, tone, scale=nows
    ss.map do |n|
        tone + nows[n-1] 
    end
end

# 将音程循环化
def ring ss, n=20
    a=[ss]*20
    a.each_with_index do |al, i|
        al.map {|e| e+12*i}            # 
    end
end

## 
def tk ss, *a
    res=[]
    a.each do |i|
        res<<ss[i]
    end
    res
end

## 生成幂集
def power ss
    s=ss 
    ## 方便 cmd 测试
    res=[]
    res<<(s.map{|e|[e]})
    s.size.times do |n|
        if n<s.size
            res << (s.product(*[s]*(n)))
        end
    end
    res.flatten(1).sort.map{|a|a.sort}.uniq.map{|a| a.uniq}.uniq
end

def sample ss
    ss.to_a.sample
end
# 将音级转化为MIDI音值
def gm ss, scale=Nows,tone=C # grade to midi
    tone + scale[ss-1]
end
def gmt ss, tone=C,scale=Nows
    tone + scale[ss-1]
end

def powsamp ss
    res=[]
    a = ss.to_a
    n = a.size
    # 取出的数量，随机
    q = (1..n).to_a.sample
    # 要取出哪些索引的值
    w=(0..(n-1)).to_a.sample(q)
    w.sort.each do |i|
        res << a[i]
    end
    res
end

def take ss, *wa
    ss=ss.to_a
    res = []
    wa.each do |i|
        res << ss[i]
    end
    res.compact.sort
end

def mirrev ss
    ss=ss.to_a
    if ss.size >= 2
        ss + ss[0..-2].reverse
    else
       ss
    end
end

def to_freq ss
    ss=ss.to_f
    Fst_pitch_freq*2.0**(ss/12.0)
end