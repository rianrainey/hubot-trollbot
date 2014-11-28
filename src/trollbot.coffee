# Description:
#   A hubot script that annoys your coworkers.
#
# Commands:
#   mongodb - Share the love.

getUsingRegex = (term) ->
  ///
    (
      used
      | using
      |
        (
          written
          | wrote\s+it
        )
        \s+
        in
      |
    )
    \s+
    (#{term})
  ///i

getLoverRegex = (term) ->
  ///
    (
      love
      | used
      | using
    )
    \s+
    (#{term})
  ///i

getHaterRegex = (term) ->
  ///
    (
      hate
      | can'?t\s+stand
      | loathe
      | despise
    )
    \s+
    (#{term})
  ///i


module.exports = (robot) ->
  robot.respond /hi/, (msg) ->
    msg.reply 'hello'

  robot.hear getUsingRegex('ruby|python|java'), (msg) ->
    msg.reply "You should rewrite it in Go."

  robot.hear getLoverRegex('mongo(db)?|go|closure|riak'), (msg) ->
    msg.reply "Hipster."

  robot.hear getHaterRegex('mongo(db)?'), (msg) ->
    msg.reply "MongoDB is web scale!"
