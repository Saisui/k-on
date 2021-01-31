::[]
::new
::try_convert
#&
#*
#+   将两个数组连接起来，并集。[1]+[2] == [1,2]
#-   差集。
#<<  塞进去。 [1,2]<<[3] == [1,2,[3]] 。  [1,2] << 3 == [1,2,3]
#<=> 比较第一个元素的大小 1 左边大，0一样，-1右边大
#==  所有元素是否相同
#[]
#[]=  将某个索引对应的元素赋值  #=> 该值。  a=[1,2]; a[6]=45 才会出现 [1,2,nil,nil,nil,nil,45] 
#abbrev 
#all?
#any?
#append
#assoc
#at
#bsearch
#bsearch_index
#clear
#collect
#collect!
#combination
#compact
#compact!
#concat 删除nil 空值
#count 数出有多少个一样的值
#cycle 循环 a.cycle(3) 返回循环3次
#deconstruct
#delete
#delete_at
#delete_if
#difference
#dig  a.dig(1,2,3) == a[1][2][3]
#drop 从开头减去一定数量元素。a.drop(3) == a[3..-1]
#drop_while 从开头 按照一定条件减去元素。【
#each
#each_index
#empty?
#eql?
#fetch
#fill 填充。若有块，则
#filter
#filter!
#find_index
#first
#flatten
#flatten!
#hash
#include?
#index
#initialize_copy
#insert 从指定索引位置插入元素
#inspect
#intersection 交集
#join
#keep_if
#last
#length
#map
#map!
#max
#min
#minmax
#none?
#one?
#pack
#permutation
#pop MU! 从末尾脱落一个元素
#prepend
#product
#push
#rassoc
#reject
#reject!
#repeated_combination
#repeated_permutation
#replace
#reverse
#reverse!
#reverse_each
#rindex
#rotate
#rotate!
#sample MU! 随机取出
#select
#select!
#shelljoin
#shift
#shuffle MU! 随机排序
#shuffle!
#size
#slice
#slice!
#sort
#sort!
#sort_by!
#sum
#take
#take_while
#to_a
#to_ary
#to_h
#to_s
#transpose
#union
#uniq
#uniq!
#unshift
#values_at
#zip
#|