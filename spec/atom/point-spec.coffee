Point = require 'point'

describe "Point", ->
  describe ".isEqual(value)", ->
    describe "when given value is a Point", ->
      it "returns true when the rows and columns match", ->
        expect(new Point(1,2)).toEqual new Point(1,2)
        expect(new Point(2,1)).not.toEqual new Point(1,2)

    describe "when given value is an Array", ->
      it "returns true only when index zero matches row and index one matches column", ->
        expect(new Point(1,2)).toEqual [1,2]
        expect(new Point(2,1)).not.toEqual [1,2]

  describe "compare", ->
    it "returns 1, 0, or -1 based on whether the given point precedes, equals, or follows the receivers location in the buffer", ->
      expect(new Point(5, 0).compare(new Point(5, 0))).toBe 0
      expect(new Point(5, 0).compare(new Point(6, 0))).toBe -1
      expect(new Point(5, 0).compare(new Point(5, 1))).toBe -1
      expect(new Point(5, 0).compare(new Point(6, 1))).toBe -1
      expect(new Point(5, 5).compare(new Point(4, 1))).toBe 1
      expect(new Point(5, 5).compare(new Point(5, 3))).toBe 1
