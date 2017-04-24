Time::DATE_FORMATS[:comment] = -> (date) do
  case
    when date >= Date.today
      I18n.t('date.formats.comment_today', time: date.strftime('%H:%M'))
    when date >= Date.yesterday && date <= Date.today
      I18n.t('date.formats.comment_yesterday', time: date.strftime('%H:%M'))
    else
      I18n.t(
        'date.formats.comment_other',
        date: I18n.l(date, format: '%e %B %Y'),
        time: date.strftime('%H:%M')
      )
  end
end