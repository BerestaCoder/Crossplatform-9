class Save
{
  Save(this._state);
  SaveState _state;
  void setState(SaveState state)
  {
    _state = state;
  }
}
enum SaveState
{
  empty,
  saved,
  corrupted
}