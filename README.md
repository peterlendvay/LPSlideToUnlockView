# LPSlideToUnlockView
Easy to implement, slide to unlock library for iOS. Can be used in both portrait and landscape mode. 


# Requirements
* iOS 7
* ARC

# Installation

Simply drag the LPSlideToUnlockView folder to your project.

# Getting Started

Create a UIView on your storyboard, add LPSlideContainerView as its Custom Class.

## Portrait mode vs Landscape mode

If the container view's width is bigger, than it's height, the slide view will be draggable to the right (landscape mode), otherwise to the bottom (protrait mode).

## Slide event
If you want to know, when the slide view was dragged to the end, you can implement it's delegate method and catch the event.

## Example project
It's still in progress, should be up soon.
Most of the LPSlideToUnlockView are shown in the example project. I highly recommend looking at it for a better understanding of this library.

# Documentation

Documentation is still in progress.

# About

I initially developed this library for a project at [Attrecto Smartphone Solutions](http://attrecto.com/).

# License

LPSlideToUnlockView is released under the Apache 2.0 license; see LICENSE for more details.
