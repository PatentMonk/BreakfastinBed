class Message
  def self.not_found(record = 'record')
    I18n.t('api.not_found', record: record)
  end

  def self.invalid_credentials
    I18n.t('api.invalid_credentials')
  end

  def self.invalid_token
    I18n.t('api.invalid_token')
  end

  def self.missing_token
    I18n.t('api.missing_token')
  end

  def self.unauthorized
    I18n.t('api.unauthorized')
  end

  def self.account_created
    I18n.t('api.account_created')
  end

  def self.account_not_created
    I18n.t('api.account_not_created')
  end

  def self.expired_token
    I18n.t('api.expired_token')
  end
end