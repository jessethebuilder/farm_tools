class ActiveRecord::Base
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
end
