

=begin ########## B U G S F I X ##########

  CANNOT USE ANY ARGS NAME LIKE  =>  'scale'
  replace for 'sc'

=end ###########   F U N C   ########### 

yes=true
y=true
no=false

$fg = -1
$go=0
$gos=[0]
$fgi  = -1i
$rail = 2.0
module Flags
    def sev n=1
        $fg *= (-1)
        $fg == 1
    end
    def ilood
        $fgi*=1i
    end
    def rail n, i=1.0,op=:+
        $rail = $rail.send(op, i)
        $rail%n
    end
end
def 
end
def looptunk binsq, &blk
  bfer = []
  pugger = []
  case binsq
  when Integer
      buf = binsq.to_s(2).split("")
  when String
      buf = binsq.split("")
  end
  loop do
      yield(buf[0],buf,bfer,pugger)
      bfer << buf[0]
      buf << buf.shift
  end
end
def looptik binsq,n,&blk
  case binsq
  when Integer
      buf=binsq.to_s(2).split("")
  when String
      buf=binsq.split("")
  end
  loop do
      yield if buf.first != "0"
      sleep n
      buf << buf.shift 
  end
end
# 从后面给出的数组中取出 第 n+1 个元素
def quchu n=0, *args
  args[n]
end

# 创建连续各种区间（开、闭、极点）
def ctnum a,b,be,ed,*exs
  Continuum.new(a,b,be,ed,*exs)
end
def ctbg a,b,*exs
    ctnum a,b,true,true,*exs
end
def ctbk a,b,*exs
    ctnum a,b,true,false,*exs
end
def ctpg a,b,*exs
    ctnum a,b,false,true,*exs
end 
def ctpk a,b,*exs
    ctnum a,b,false,false,*exs
end

def caseeq ss, arr, el
  ss.each_with_index do |e,i|
      if el==e
          return arr[i]
      end
  end
end
def r n,d
  Rational(n,d)
end
# 定义以音级和 音阶 生成 旋律 的函数
# degree to pitch for list

# 格式   1  一级 。 1.1 1#  1.2=1##  1.01=1b  1.02=1bb
def dgpl queue, sc=[0, 2, 4, 5, 7, 9, 11]  #<= sc=DIATONIC
  notes = []
  queue.each do |i|
      if i.is_a? Float
          i=i.to_s.split(".")
          d=i[0].to_i-1
          case i[1][0]
          when 0
              notes << (sc[d]-i[1][1..-1].to_i)
          else
              notes << (sc[d] + i[1][0..-1].to_i)
          end
      else
          d=i-1
          notes << sc[d]
      end
  end
  notes
end
def dgps  queue, scale
  notes = ""
  queue.each do |i|
      d=i-1
      notes << scale[d].to_s << " "
  end
  notes.rstrip
end

def dd
pp self
end
def ko *args
args
end
def ok *args
args.flatten(1)
end
def kk *args
args.flatten
end

# ########## MODULES ##########





###########   F U N C   ########### 



# class Numeric
#   def gm sc=Nows
#       ss=self
#       d=ss/sc.size
#       sc.cycle.first(ss)[ss-1]+d*12
#   end
# end

class String
  def each &blk
      ss=self
      ss.each_char(&blk)
  end
end

class Integer
  def dg
    bigs = [:C,:D,:E,:F,:G,:A,:B]
    [:c,:d,:e,:f,:g,:a,:b][self-1]
  end
end

class NilClass
  def method_missing *args
      nil
  end
end
class Array
  # 将子字符串按照 arg 分割成数组
  # "0 1 0 1 2 | 1 01 01 | 01 0".split("|").split(" ")
  # => [["0","1","0","1","2"],["1","01","01"],["01","0"]]
  def split arg
      self.map {|a| a.split(arg)}
  end
end
class Array
  def sqDG *args
      res = []
      args.each do |a|
          if a.zero?
              res << nil
          else
              res << self[a-1]
          end
          res
      end
  end
  def op opr, i
    self.map{|n| n.send(opr, i)}
  end
### 上行操作
  def u_ i
    self.map{|n| n+i}
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
### 下行操作
  def d_ i
    self.map{|n| n-i}
  end

  # 将音阶(半音序列) 变成音程序列（半音计数）
  def to_ic
    res=[]
    self.each_with_index do |n, i|
      if i>0 
        res << (n - self[i-1]) 
      end
    end
    res << (self[0] - self[-1])
    res
  end
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
  def tk *a
      res=[]
      a.each do |i|
          res<<self[i]
      end
      res.compact
  end
  # 从音阶中按索引取出元素，自动删除 nil 和 进行排序
  def take *wa
      ss=self
      ss=ss.to_a
      res = []
      wa.each do |i|
          res << ss[i-1]
      end
      res.compact
  end
  # 对数组的某一级进行操作，如将自然音阶的4级上升半音 DIATONIC.iop(4) 变成 LYDIAN 音阶。
  # 然后使用 #sort 方法进行排序，以变成音阶。也可以使用 #uniq 去除重复音级确保为音阶。
  def iop degree=1, op=:+, a=1
      ss=self
      res = ss
      res[degree-1] = res[degree-1].send(op, a)
      res
  end
end

class Array
  # 将连续的元素删除为一个，需要 Array#mmt
  def maquak 
      # ss=self
      # res=[]
      # ss.each_with_index do | e, i |
      #     if ss[i] != ss[i+1]
      #     res << ss[i]
      #     end
      # end
      self.mmt{|l,i,a,b| a==b}.map{|a|a.uniq}.flatten
  end

  #可以实现将数组翻转。[1,2,3]**-2 = [3,2,1,3,2,1]
  def ** ano
      ss=self
      case ano
      when Numeric
      case ano
      when Integer
          if ano >= 0
          return ss*ano
          elsif ano < 0
          return ss.reverse*(-ano)
          end
      when Rational
          n=ano.numerator.to_f
          d=ano.denominator.to_f
          sz = ss.size.to_f
          #### to_i output ####
          k = (n/d).to_i
          y = (sz/d*n).to_i
          z = r(n%d,d)
          if ano > 0 and ano <= 1
          return ss[0,y]
          elsif ano > 1
          return ss*k + ss.send(:**, z)
          elsif ano < 0
          return ss.reverse.send(:**, -ano)
          end
      when Float
          self.send(:**, ((ano.to_s)+"r").to_r)
      # when Complex
      end
      # when Array
      when Range

      end
  end
  # 对每个元素map send。 如 DIATONIC.mapsend(:+,2)
  def mapsend *ops 
      ss=self
      return ss.map {|n| n.send(* ops)}
  end
  def mapsend! *ops
      self.map! {|n| n.send(* ops)}
  end
  # 将连续相同的元素组合为一组，不相同的单独为一组
  def samchg 
      ss  = self
      res = []
      i=0 # ss的起始索引
      k=0 # ss的步数增加
      j=0 # res 的索引
      while i < ss.size
          res << []
          k=0
          while ss[i]==ss[i+k]
              res[j]<<ss[i+k]
              k+=1
          end
          i+=k
          j+=1
      end
      res
  end
  alias samechaingrp samchg
  def namda &blk
      ss  = self
      res = []
      # ss的起始索引
      i=0
      # ss的步数增加
      k=0 
      # res 的索引
      j=0
      while i < ss.size
          res << []
          k=0
          while yield(ss[i],ss[i+k])
              res[j]<<ss[i+k]
              k+=1
          end
          i+=k
          j+=1
      end
      res
  end

  ##  按顺序根据条件进行组合
 def mmt &blk
   ss=self
   return self if ss.empty?
   us=ss
   res = []
   buf = []
   res << [us[0]]
   buf << us[0]
   until us[1].nil?
      #                与buffer组合    第一个  前一个  当前  
     if not(((  ((   yield(buf+[us[1]],buf[0],us[0],us[1])   )) rescue true)))
       res << []
       buf = [us[1]]
     else
       buf << us[1]
     end
     res.last << us[1]
     us=us[1..-1]
   end
   res
 end
 # 需要 mmt
 def mmtab &blk 
  self.mmt do |arr, i, a, b|
    yield(a,b)
  end
end

#需要 mmt
def mmtib &blk 
  self.mmt do |arr, i, a, b|
    yield(i,b)
  end
end
def mmtr &blk # 需要 mmt
  self.mmt do |arr, i, a, b|
    yield(arr)
  end
end
def mmtri &blk # 需要 mmt
  self.mmt do |arr, i, a, b|
    yield(arr,i)
  end
end
#对于所有的a，都有条件。符合。  如  对于所有a <- A, 存在 b <- B， 使得 b < a。
def forall  
  res = true
  self.each do |a|
    res = false and break if not yield(a)
  end
  res
end
def forexist
  res = false
  self.each do |a|
    res = true and break if yield(a)
  end
  res
end
def forExs
  res = []
  self.each do |a|
      if yield(a)
          res << a
      end
  end
  res
end
def powerset
  num = 2**size
  ps = Array.new(num, [])
  self.each_index do |i|
    #print "i := #{i}/n"
    a = 2**i
    b = 2**(i+1) - 1
    j = 0
    while j < num-1
    #print "j := #{j}, (#{j+a}..#{j+b})/n"
      for j in j+a..j+b
        ps[j] += [self[i]]
        #print "ps[#{j}] = #{ps[j]}/n"
      end
      #print "j := #{j}/n"
      j += 1
    end
  end
  ps
end
end

# 通用方法
class Array
  def rm *args
      res=self
      args.each {|e| res.delete(e) }
      res
  end
  def in_groups_of n, *r
     res=[]
     if r.empty?
          self.each_index { |i|
             next if i% n != 0
             res<<self[i...i+n]
          }
      else
          (self.size.to_f/n).ceil.times { |i| 
            res<<[]
            n.times { |j|
            res[i]<<self[i*n+j]   }}
          res.map!{|a| a.map!{|e| e.nil? ? r[0] : e }}
      end
      res
  end
  alias ingof in_groups_of
  # 检查是否包含某个元素
  def has? *args
    res = false
     if args.empty? then res = false else self.each{ |e| args.each{ |r| (res = true) if (e == r) } } 
      res 
    end
  end
  def all? *args
    fg = 0
    if args.empty? then return false
    else args.each{|r| self.each{|e|  (fg+=1 and break) if e==r}}
    end
    fg == args.size ? true : false
  end
  # 筛选元素，依赖 Array#has?
  def rm *args
      self.select{|a| not (args.has? a) }
  end
end


module Enumerable
  def tk *a
      res=[]
      ss=self.to_a
      a.each do |i|
          res<<ss[i]
      end
      res.compact
  end
  def ic
      ss=self
      res=[]
      ss.each_with_index do |n, i|
          res << (n - ss[i-1]) if i>0
      end
      res << ((ss[0] - ss[-1])%12)
      res
  end
  def icv
      ss = self.to_a
      all=[]
      list = ss.map{ |n| n%12 }
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
  def iv
      ss = self.to_a
      all=[]
      list = ss.map{ |n| n%12 }
      list.size.times do |i|
          ((i+1)..(list.size-1)).each do |j|
              all << (list[j]-list[i])
          end
      end
      all.map!{|n| n.abs}.map!{|n| n%12}
      res = []
      (0..11).each do |i|
          res << all.count(i)
      end
      res
  end
  def powsamp
      ss=self
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
  def lod
      ss=self
      $fg*=(-1)
      ss[(1+$fg)/2]
  end
  def rail n, i=1
      ss=self
      $rail+=i
      ss[$rail%n]
  end
  def gm sc=Nows
      ss=self
      res=[]
      ss.
      <<sc[ss-1]
  end
end

class Object
def ret n
  n
end
def cyc *args
  if args.empty?
    self
  else
    res=self
    args.each do |a|
      res=res.send(* a)
    end
    res
  end
end
def cyd *duo
    if duo.empty?
        self
    else
        res=self
        ops=duo[0]
        argsl=duo[1]
        duo[0].each_with_index do |op, i|
            res=res.send(op,*argsl[i])
        end
        res
    end
end
def cyt *opa
  if opa.empty?
      self
  else  
    res=self
    opa.each_with_index do |op, i|
      if i%2==1 
        next
      else
        paras=[op]+([opa[i+1]]||[])
        res=res.send(*paras)
      end
    end
    res
  end
end
end

class String
  def bin
      self.to_i(2)
  end
  def inv
     s=self
     res=""
     sz=self.size
     u=    ( (s.to_i(2))^(2**sz-1) ).to_s(2)
     ts=u.size
     res<<"0"*(sz-ts)<<u
     res
  end
  def ones
      self.count("1")
  end
end
class Integer
  # 将十进制按照每位的1和0转化为 二进制。
  def tb
      self.to_s.to_i(2)
  end
  # 输出有多少个1。 可以检查 乐句有多少个非0音符。
  def ones
      self.to_s(2).count("1")
  end
  # 将self的二进制值，补全0到 n 位，并返回 字符串。
  def bin n
      res=""
      u=self.to_s(2)
      sz=u.size
      res=""
      res<<"0"*(n-sz)<<u
      res.to_s
  end

  # 将 二进制字符串/整数 s ，补全到 n 位，并返回字符串
  def sq s
      n=self
      res=""
      case s
      when Integer
          sz=s.to_s(2).size
          res<<"0"*(n-sz)<<s.to_s(2)
      when String
          sz=s.size
          res<<"0"*(n-sz)<<s
      end
  end
  def onesup
      self.to_s(2).split
  end




end
  
 


class Complex
def vec
  ss=self
  [ss.real, ss.imag]
end
end

class Continuum

  def initialize a,b,be=false, ed=false, *exs
    @lbound = a
    @rbound = b
    @exclude_begin = be
    @exclude_end = ed
    @exclude_nums = exs
  end

  # 依赖Array#has? Array#rm
  # 获得 在
  def wr w, n=-1
    n = (n==-1 ? w.to_s.split(".")[-1].size : n)
      ss=self
      res = []
      a = @lbound
      b = @rbound
      z = a
      exes = []
      exes += ((@exclude_begin ? [@lbound] : []) + (@exclude_end ? [@rbound] : []) + @exclude_nums)
      if a<b then
        while z < b
             res << z
             z += w
        end 
      elsif a>b then
        while z > b
            res << z
            z -= w
        end
      end
        res << b
      res.rm(*exes).map{|a| a.round(n)}
  end

  def r= b ; @ubound = b ;end
  def l= a; @lbound = a;end
  def r; @rbound ;end
  def l; @lbound;end
  def exbe! tf = true;@exclude_begin = tf;end
  def exed! tf = true;@exclude_end = tf;end
  def icbe! tf = true;@exclude_begin = !tf;end
  def iced!;@exclude_end = !tf;end
  def cgbe tf=false
      tf==false ? @exclude_begin : @exclude_begin = ! @exclude_begin
  end
  def cged tf=false
      tf==false ? @exclude_end : @exclude_end = ! @exclude_end
  end
  def cgbe! tf=true
    tf==false ? @exclude_begin : @exclude_begin = ! @exclude_begin
  end
  def cged! tf=true
      tf==false ? @exclude_end : @exclude_end = ! @exclude_end
  end
  def exbe?; @exclude_begin; end
  def exed?; @exclude_end; end
end

class Range
  def sample
      self.to_a.sample
  end
  def wr w,n=5
      ss=self
      res = []
      a = ss.begin
      b = ss.end
      z = a
      if a<b then
      while z < b
        res << z.round(n)
        z += w
      end

      elsif a>b then
      while z > b
        res << z.round(n)
        z -= w
      end
      end
      res << b unless ss.exclude_end?
      res
  end
  def ssam w

  end
end

# # module SC
#     FIVES_DG   = [1, 2, 3, 5, 6]
#     DEGREES    = [1, 2, 3, 4, 5, 6, 7]
#     # CHURCH SCALE
#     # take *(2..8)
#     DIATONIC   = [0, 2, 4, 5, 7, 9, 11]
#     DORIAN     = [0, 2, 3, 5, 7, 9, 10]
#     PHRYGIAN   = [0, 1, 3, 5, 7, 8, 10]
#     LYDIAN     = [0, 2, 4, 6, 7, 9, 11]
#     MIXOLYDIAN = [0, 2, 4, 5, 7, 9, 10]
#     AERION     = [0, 2, 3, 5, 7, 8, 10]
#     LOCRIAN    = [0, 1, 3, 5, 6, 8, 10]
# # end
# DI=DIATONIC

# DIATONIC = ("101011010101"<<"b0").reverse.to_i(2)
# OTHERS SCALE

# ######### MODULES ##########

# ######## VAR ##########


# Y=true
# N=false

# Fst_pitch_freq = 27.5
# Equaly = 12
# Base_pitch_freq = 440
# Nows = DIATONIC ## nowa scale
# TONE=60



# ######### VAR ##########



# ######### LOOP #########



# with_fx :reverb, room: 1 do
#     live_loop :time do
#       synth :prophet, release: 8, note: :e1, cutoff: 90, amp: 3, rate: rrand(-2,2)
#       sleep 8
#     end
# end
# live_loop :machine do
#     sample :loop_garzul, rate: rrand(-3,1.5), finish: 0.25
#     sample :loop_industrial, beat_stretch: 4, amp: 1
#     sleep 4
# end
# live_loop :kik do
#     sample :bd_haus, amp: 2
#     sleep 0.5
# end
# with_fx :echo do
#     live_loop :vortex do
#     #   use_random_seed 800
#         notes = scale 50*1, :minor_pentatonic, num_octaves: 3
#         16.times do
#         play notes.choose, release: 0.1, amp: 1.5
#         sleep 0.125
#        end
#     end
# end

# loop do
#     play 60 + rail(7,2)   , pan: rrand(-1,1),     amp: rrand(0.1,1)
#     sleep a=rrand(0.1,1)
#     play 60 + rail(5,0)      , pan: rrand(-0.5,0.5), amp: rrand(0.1,1)
#     sleep (1-a)**2
# end