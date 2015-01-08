Time.zone = 'UTC'
ActiveSupport::JSON::Encoding.time_precision = 0
{
  :stylish                 => "%l%P, %B %e",          # 9am, April 13
  :long_date               => "%a, %b %e, %Y",        # Fri, Apr 13, 1982
  :longer_date             => "%B %e, %Y %H:%M %Z",   # April 13, 1982 9:18
  :classy                  => "%B %e, %Y at %l:%M%P", # April 13, 2010 at 9:18am
  :index                   => "%Y/%m/%e %H:%M",       # 1982/04/13 9:18
  :birthdate               => "%A, %b %e, %Y",        # Friday, Apr 13, 1982
  :standard                => "%B %e, %Y",            # April 13, 1982
  :abbr_month              => "%b",                   # Apr
  :abbr_month_day          => "%b %e",                # Apr 13
  :week_month_day          => "%A, %B %e",            # Friday, April 13
  :week_abbr_month_day     => "%A, %b %e",            # Friday, Apr 13
  :week_month_day_time     => "%A, %B %e %l:%M%P",    # Friday, April 13 9:00pm
  :week_month_day_at_time  => "%A, %B %e at %l:%M%P", # Friday, April 13 at 9:00pm
  :search                  => "%Y-%m-%e %H:%M",       # 1982-04-13 9:18
  :date_stamp              => "%Y-%m-%e",             # 1982-04-13
  :date                    => "%m/%e/%Y",             # 04/13/1982
  :time                    => "%l:%M %p",             # 9:18am
  :month_day               => "%m/%e",                # 04/13
  :weekday                 => "%A",                   # Friday
  :weekday_at              => "%A at %l:%M%P",        # Friday at 9:00pm
  :weekday_abbr_at         => "%a at %lP",            # Fri at 9pm
  :abbr_weekday            => "%a",                   # Fri
  :at                      => "%a %b %e @ %l%P",      # Fri Dec 13 @ 9am
  :at_day                  => "%a @ %l%P",            # Fri @ 9am
  :medium_style            => "%b %e, %Y",            # Dec 13, 1937
  :hour                    => "%l%P",                 # 9am
  :month_day               => "%B %e",                # April 13
  :month                   => "%B",                   # April
  :month_year              => "%B %Y",                # April 1982
  :xml_team_timestamp      => "%m%d%YT%H%M%S%z"       # 08012012T000000-0400

}.each do |format_name, format_string|
  Time::DATE_FORMATS[format_name] = format_string
end
