class BirthdateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || value.to_date > 18.years.ago.to_date
      record.errors.add attribute, (options[:message] || "you should be over 18 years old")
    end
  end
end