require 'bundler'
Bundler.require

module Concerns
  def self.included(base)
    base.extend(MusicBase)
    base.include(MusicStore)
    base.extend(Findable)
  end
end

require_all 'lib'
