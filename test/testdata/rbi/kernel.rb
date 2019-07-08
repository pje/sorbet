# typed: true

T.assert_type!(catch(1) { throw 1 }, BasicObject)
T.assert_type!(catch(1) { throw 1, 'test' }, BasicObject)
T.assert_type!(catch {|obj_A| throw(obj_A, 'test')}, BasicObject)
T.assert_type!(catch {1}, BasicObject)

T.assert_type!(caller, T::Array[String])
T.assert_type!(caller(10), T.nilable(T::Array[String]))

T.assert_type!(BigDecimal('123', 1, exception: true), BigDecimal)
T.assert_type!(Float('123.0'), Float)
T.assert_type!(Integer('123', exception: true), Integer)
T.assert_type!(Rational('1/1', 2, exception: true), Rational)

T.assert_type!(Complex('123', 'foo'), Complex)
T.assert_type!(Complex('123', exception: false), Complex)

# make sure we don't regress and mark `loop` as returning `nil`
x = loop {break 1}
if x
  puts x + 1
else
  puts x
end

define_singleton_method(:foo) { puts '' }
define_singleton_method('foo') { puts '' }
