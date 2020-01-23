class Act < ApplicationRecord
  belongs_to :live, class_name: "Live", optional: true
end
