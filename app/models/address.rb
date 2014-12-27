class Address < ActiveRecord::Base
  belongs_to :has_address, :polymorphic => true

  def to_s
    s = ''
    [:street, :street2, :street3, :city, :state, :zip].each do |sym|
      s += "#{send(sym)}, " if send(sym)
    end
    s.length > 2 ? s.chop.chop : s
  end
end