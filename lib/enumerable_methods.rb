module Enumerable
  def my_each
  	return self unless block_given?
  	for e in self
  	  yield e
  	end
  end

  def my_each_with_index
  	return self unless block_given?
  	0.upto(self.size-1) do |i|
      yield self[i], i
  	end
  end

  def my_select
  	return self unless block_given?
  	arr = []
  	self.my_each do |e|
  	  if (yield e) == true
  	  	arr << e
  	  end
  	end
  	arr
  end

  def my_all?
  	return nil unless block_given?
    result = true
    self.my_each do |e|
      result = result && (yield e)
    end
    result
  end

  def my_any?
  	return nil unless block_given?
    result = false
    self.my_each do |e|
      result = result || (yield e)
    end
    result
  end

  def my_none?
  	return nil unless block_given?
  	!(self.my_any?)
  end

  def my_count
    self.length
  end

  def my_map(proc=nil)
  	if !proc.nil?
		arr = []
	  	self.my_each do |e|
	  		result = proc.call e
	  		arr << result
	  	end
	  	arr
	elsif block_given?
		arr = []
	  	self.my_each do |e|
	  		result = yield e
	  		arr << result
	  	end
	  	arr
	else
  		return self
  	end
  end

  def my_inject
    return self unless block_given?
    accu = self[0]
  	self[1..-1].my_each do |e|
  	  	accu = yield accu, e
  	end
  	accu
  end
end

def multiply_els(arr)
  arr.my_inject do |multi, e|
  	multi * e
  end
end