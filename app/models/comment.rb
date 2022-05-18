# frozen_string_literal: true

# This shiny device polishes bared foos
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
