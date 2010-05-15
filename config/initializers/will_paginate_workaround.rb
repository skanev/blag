# will_paginate loads before rails (since this uses bundler) and the fails to
# monkey patch active_record and action_pack. All things considered, doing it
# manually is an ugly, but simple solution. Find more here:
# http://yehudakatz.com/2010/04/17/ruby-require-order-problems/
WillPaginate.enable_activerecord
WillPaginate.enable_actionpack