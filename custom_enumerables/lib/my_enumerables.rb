# frozen_string_literal: true

# Monkeypatched Enumerables
module Enumerable
  def my_each(&prc)
    return to_enum(:my_each) unless block_given?

    if instance_of?(Range) || instance_of?(Array)
      arr = to_a
      arr.size.times { |i| prc.call(arr[i]) }
    elsif instance_of?(Hash)
      then size.times { |i| prc.call(keys[i], values[i]) }
    end
    self
  end

  def my_each_with_index(&prc)
    return to_enum(:my_each_with_index) unless block_given?

    if instance_of?(Array)
      size.times { |i| prc.call(self[i], i) }
    else
      keys.size.times { |i| prc.call(assoc(keys[i]), i) }
    end
    self
  end

  def my_select(&prc)
    return to_enum(:my_select) unless block_given?

    if instance_of?(Array)
      selected = []
      my_each { |el| selected << el if prc.call(el) }
    else
      selected = {}
      my_each { |k, v| selected[k] = v if prc.call(k, v) }
    end
    selected
  end

  def my_all?(pattern = nil, &prc)

    if instance_of?(Array)
      if !pattern.nil?
        my_each { |el| return false unless pattern === el }
      elsif prc
        my_each { |el| return false unless prc.call(el) }
      else
        my_each { |el| return false if el == false || el.nil? }
      end
    elsif instance_of?(Hash)
      if !pattern.nil?
        my_each { |el| return false unless pattern === el }
      elsif prc
        my_each { |k, v| return false unless prc.call(k, v) }
      end
    end
    true
  end

  def my_any?(pattern = nil, &prc)
    if instance_of?(Array)
      if !pattern.nil?
        my_each { |el| return true if pattern === el }
      elsif prc
        my_each { |el| return true if prc.call(el) }
      else
        my_each { |el| return true unless el == false || el.nil? }
      end
    elsif instance_of?(Hash)
      if !pattern.nil?
        my_each { |el| return true if pattern === el }
      elsif prc
        my_each { |k, v| return true if prc.call(k, v) }
      end
    end
    false
  end

  def my_none?(pattern = nil, &prc)
    if instance_of?(Array)
      if !pattern.nil?
        my_each { |el| return false if pattern === el }
      elsif prc
        my_each { |el| return false if prc.call(el) }
      else
        my_each { |el| return false if el == false || el.nil? }
      end
    elsif instance_of?(Hash)
      if !pattern.nil?
        my_each { |el| return false if pattern === el }
      elsif prc
        my_each { |k, v| return false if prc.call(k, v) }
      end
    end
    true
  end

  def my_count(obj = nil, &prc)
    return size if !prc && obj.nil?
    
    count = 0
    prc = proc { |el| el if el == obj } unless obj.nil?
    my_each { |el| count += 1 if prc.call(el) }
    count
  end

  def my_map(prc = nil, &blc)
    return to_enum(:my_map) unless block_given?

    result = []
    my_each { |el| prc.nil ? result << prc.call(el) : result << blc.call(el) }
    result
  end

  def my_inject(acc = nil, &prc)
    my_each { |el| acc = acc.nil? ? el : prc.call(acc, el) }
    acc
  end
end