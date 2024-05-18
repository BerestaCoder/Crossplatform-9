class Save
{
  Save(this._state);
  SaveState _state;
  void setState(SaveState state)
  {
    _state = state;
  }
  SaveState getState()
  {
    return _state;
  }
}
enum SaveState
{
  empty,
  loading,
  saved,
  corrupted,
}