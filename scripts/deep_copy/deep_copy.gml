/// @param {Struct|Array} _input
function deep_copy(_input) {
  return json_parse(json_stringify(_input));
}
