module StringHelper
  def only_numbers_string?(string)
    string.scan(/\D/).empty?
  end
end