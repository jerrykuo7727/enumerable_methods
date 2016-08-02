module Enumerable
  def my_each
  	return self unless block_given?
  	for e in self
  	  yield e
  	end
  end

  def my_each_with_index
  	return self unless block_given?
    i = 0
  	self.my_each do |e|
      yield e, i
      i += 1
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

  def my_inject(param=nil)
    return self unless block_given?
    if param.nil?
      myself = self
      if myself.is_a?(Hash)
        accu = myself.shift[1]
      else
        accu = myself.shift
      end
  	  myself.my_each do |e|
  	  	accu = yield accu, e
  	  end
  	accu
    end
  end
end

def multiply_els(arr)
  arr.my_inject do |multi, e|
  	multi * e
  end
end