class ScheduleSerializer < BaseSerializer
  attributes :monday_opens_at, :monday_closes_at, :tuesday_opens_at, :tuesday_closes_at,
             :wednesday_opens_at, :wednesday_closes_at, :thursday_opens_at, :thursday_closes_at,
             :friday_opens_at, :friday_closes_at, :saturday_opens_at, :saturday_closes_at,
             :sunday_opens_at, :sunday_closes_at
end
