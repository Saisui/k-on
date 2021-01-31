class array

    ### 操作  #=> array 音级
    def op opr, i
        self.map{|n| n.send(opr, i)}
    end

    ### 上行操作
    def u_ i
        self.map{|n| n+i}
    end

    ### 下行操作
    def d_ i
        self.map{|n| n-i}
    end
    
    ### 倒影操作
    def invs_ mirl
        self.map do |n|
            n - (n-mirl)*2
        end
    end

    ### 模进同一音列
    def maki i=1
        self.map{|n| n%12 }
    end

    ### 变成有向音程行进链
    def to_ic
        res=[]
        self.each_with_index do |n, i|
            res << (n - self[i-1]) if i>0
        end
        res << (self[0] - self[-1])
        res
    end

    ### 音程含量
    def icv
        all=[]
        list = self.map{|n| n%12 }
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
    def gm tone, scale=Nows
        self.map do |n|
            tone + nows[n-1] 
        end
    end

    # 将音程循环化
    def ring n=20
        a=[self]*20
        a.each_with_index do |al, i|
            al.map {|e| e+12*i}            # 
        end
    end

    ## 
    def tk *a
        res=[]
        a.each do |i|
            res<<self[i]
        end
        res.compact
    end

    ## 生成幂集
    def power
        s=self 
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
        def take *wa
            ss=self
            ss=ss.to_a
            res = []
            wa.each do |i|
                res << ss[i]
            end
            res.compact.sort
        end
    end
    def iop degree=1, op=:+, a=1
        ss=self
        res = ss
        res[degree-1] = res[degree-1].send(op, a)
        res
    end
end


class Range
    def sample
        self.to_a.sample
    end
end
class Numeric
    # 将音级转化为MIDI音值
    def gm scale=Nows,tone=C # grade to midi
        tone + scale[self-1]
    end
    def gmt tone=C,scale=Nows
        tone + scale[self-1]
    end
    def to_freq
        ss=self
        ss=ss.to_f
        27.5*2.0**(ss/12.0)
    end
end

