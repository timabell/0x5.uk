---
title: "Why is reading bad code so painful?!"
layout: post
redirect_from: /2025/01/31/why-is-reading-bad-so-code-painful/
---

I was reading some code recently that had a bunch of problems at various layers, and in spite of all my years of coding and the fact that it's not even my project, I *still* find myself getting strong feelings of anguish and "pain". I found myself wondering *why*. I understand what's bad about the code, and these days can largely explain what properties of the code I'm looking at make it objectively "bad" (e.g. "this violates the single-responsibility principle"). But why it's such an emotional reaction was still puzzling to me.

I did some internet searching, and the search engines generally thought I was really asking "what makes code painfully bad" rather than "what makes bad code so painful".

But wait, now we have the mighty AI in the sky that has consumed all human knowledge and compressed it into a statistical model, so I turned to that. What follows is a lightly edited output, which in my opinion does a good job of providing an explanation of why us cave-dwelling-flesh-bags-turned-programmers don't just dispassionately observe the horrors unfolding in our IDE.

## Cognitive Dissonance (Expectation vs. Reality)

Our brains expect **logical, structured patterns** in code.

Bad code **violates** these expectations, causing mental discomfort.

This dissonance triggers frustration, similar to hearing an off-key note in music or reading a grammatically incorrect sentence:

- *"He go store buy apple now."* (What??!)

For example:

```python
# function p(x)
def p(x):
    return x+x*3/2-7 if x%2==0 else x*2/3+8-x
```
*(Why does this function exist? What is it doing? Why?!!)*

See also: [code golf](https://codegolf.stackexchange.com/).

## Mental Overload (Cognitive Load Theory)

Bad code forces the brain to **work harder than necessary**.

Good code fits within our **working memory** and follows familiar patterns.

Bad code disrupts this, leading to **cognitive exhaustion**—like straining a muscle.

This overuse of mental resources can cause **real physical discomfort**.


## Violation of Pattern Recognition (The "Ugly Code" Effect)

The human brain **loves patterns**—in language, music, and visuals.

Good code follows **established design principles** (DRY, SOLID, clear naming conventions).

Bad code is **chaotic and unpredictable**, triggering a **"something is wrong"** reaction.

It’s like seeing a **distorted face in a picture**—our instinct is **disgust or distress**.


## Emotional Attachment to Code Quality

Developers see **clean code as a reflection of their intelligence and discipline**.

The failure to follow good programming practices can feel like sacrilege to an experienced developer, much as it would feel if someone **vandalized a work of art**, or someone **trashed a well-maintained house or religious temple**.

If you **have to maintain** the bad code, the emotional response intensifies:

> *"Why did someone do this? Now I have to fix it?!"*


## Fight-or-Flight Response (Biological Stress Reaction)


**Confusion and unpredictability** trigger mild **stress responses** in the brain.

The **amygdala** (which processes threats) **doesn’t distinguish between "bad code" and actual danger**.

This can cause:

- Actual **feelings of discomfort**
- Increased heart rate
- Full on [amygdala hijack](https://www.simplypsychology.org/amygdala-hijack.html) where the rational brain is rendered helpless

Just like bad user interface designs can frustrate users, bad code creates a negative physiological response.


## The "Torture by a Thousand Paper Cuts" Effect


One small bad practice isn’t painful on its own.

But encountering **hundreds of tiny problems**—inconsistent naming, bad formatting, cryptic logic—builds up like an **accumulation of tiny frustrations**.

This leads to an almost **physical sensation of irritation**, like **nails on a chalkboard**.


## Your Brain is Screaming "NO!!"

Reading bad code **feels painful** because your brain recognizes disorder, struggles to process it, and instinctively **resists it**.

It’s a mix of:

- **Cognitive overload**
- **Emotional frustration**
- **Mild biological stress responses**

That pain? It’s your brain begging for **clarity, familiarity, ease and structure**.
