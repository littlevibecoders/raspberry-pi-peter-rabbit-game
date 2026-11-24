# The prompts we used

These are the real prompts from the video. The first one was **spoken** into Claude with
the microphone button, so it reads like talking, not like writing. We kept the wording
exactly as it was transcribed. That's the point: you don't need perfect sentences, you need
**clues**.

## 1. The whole game, in one go

> So make a game where you're in a garden and there's you're the only one there. It's day
> and it turns night in 3 minutes. It slowly turns night. And make it so there's lots of
> crops and lots of places to hide. Make it so the Peter Rabbit can run fast, but not that
> fast, but he can still run faster than you. Make it so he can hide in places, and if you
> find him, you can press E. It says E when you can catch him. Then if you press E, you win
> the round. And the next round, Peter's faster and hides in more difficult places to go.

**What each part told the AI:**

| The kid said | The AI made |
|---|---|
| "a garden and you're the only one there" | A big fenced garden with crop beds, trees, a pond, a shed, haystacks and wheelbarrows. No other people. |
| "it turns night in 3 minutes. It slowly turns night" | A 3-minute day-to-night sky. Lanterns and fireflies come on at dusk. |
| "lots of crops and lots of places to hide" | Corn, sunflowers, pumpkins, carrots and cabbages, plus about 40 bushes, log piles and rabbit burrows. |
| "run fast, but not that fast, but faster than you" | Peter starts at 1.22× your speed. |
| "It says E when you can catch him" | An **E** pops up above Peter when you're close enough. |
| "the next round, Peter's faster and hides in more difficult places" | Every round Peter gets faster, picks harder spots, rustles less, and may bolt when you get close. |

The AI also added things nobody asked for, like rustling leaves, footprints and ear tips as
clues. If you don't like a surprise, just say so in the next prompt.

## 2. Put it on the Raspberry Pi

> make the game for my raspberry pi, it should play there

The AI already knew how to reach the Pi from an earlier project (a grown-up had set up a
secure SSH key once). It made the touchscreen controls work on the Pi, added a rainbow **X**
to close the game, made it lighter so a small computer runs it smoothly, put an icon on the
Pi's desktop and opened it.

## Try it yourself

Start your own prompt with what the world looks like, who's in it, how you win, and how it
gets harder. For example:

> Make a game where I'm a penguin on an iceberg at night. Snowballs fall from the sky and I
> move left and right with the arrow keys to dodge them. Every 20 seconds they fall faster.
> If one hits me, show my score and a big "Play again" button. Make it work on a touchscreen
> too, and keep it all in one HTML file.

Then play it, and tell the AI what to fix: *"The snowballs are too fast at the start"*,
*"I want a sound when I get hit"*, *"Make the penguin waddle."*
