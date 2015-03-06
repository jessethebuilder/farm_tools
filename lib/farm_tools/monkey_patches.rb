# module ApplicationHelper
#   include HtmlTools
#   include HtmlParts
# end

class ActiveRecord::Base
  def self.group_records(records, attr, count: 'all')
    all_hash = records.group_by{ |r| r.send(attr) }
    h = {}
    i = 0
    if count == 'all'
      h = all_hash
    else
      all_hash.each do |k, v|
        if i < count
          h[k] = v
          i += 1
        else
          break
        end
      end
    end
    h
  end

  def self.acts_like_an_array(*args)
    delin = '<!@--@!>'

    args.each do |arg|
      define_method(arg) do
        attr = read_attribute(arg)
        attr ? attr.split(delin) : []
      end

      define_method("#{arg.to_s}=") do |array|
        write_attribute(arg, array.join(delin))
      end

      define_method("add_#{arg.to_s}") do |array_items|
        array_items.class == Array ? items = array_items : items = [array_items]
        arr = send(arg)
        items.each{ |item| arr << item }
        write_attribute(arg, arr.uniq.join(delin))
      end
    end
  end

  def convert_blank_to_nil(*args)
    args.each{ |attr| write_attribute(attr, nil) if read_attribute(attr).blank? }
  end
end

class Array
  def match_at(regexp_or_string)
    regexp_or_string.class == String ? regex = eval("/#{regexp_or_string}/") : regex = regexp_or_string
    counter = 0
    self.each do |i|
      return counter if i =~ regex
      counter += 1
    end
    nil
  end

  def move(from, to)
    arr = self.dup
    arr.move!(from, to)
  end

  def move!(from, to)
    to = to % self.count if to >= self.count
    self.insert(to, delete_at(from))
  end

  def out_of_range?(index)
    ret = true
    if index >= 0
      ret = false unless self.fetch(index, IndexError) == IndexError
    end
    ret
  end
end
