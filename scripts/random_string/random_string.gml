/// @param {Real} _count       number of characters to return
function random_string(_count) {
  var _result = "";
  repeat (_count) {
    _result += chr(floor(random(26)) + 97); // ASCII values for lowercase letters (97-122)
  }
  return _result;
}
