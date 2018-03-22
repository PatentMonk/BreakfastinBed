class Factory
  require 'factories'

  def Factory.build(type, args={})
    f = ::Factories.send(type)
    f.assign_attributes(args)
    f
  end

  def Factory.create(type, args={})
    f = build(type, args)
    f.save!
    f
  end
end
