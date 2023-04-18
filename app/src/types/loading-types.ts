export type LoaderState =
  'initial' | 'loading' | 'success' | 'error' | 'disabled'

export type UIElement =
  'yourElementHere' |
  'anotherElement' |
  's3UploadButton' |
  's3UploadProgress'

export interface UILoader {
  [key: string]: LoaderState
}
export interface StatusMap {
  [key: string]: boolean;
}

export type UILoaderState = {
  [K in UIElement]: LoaderState
}

export const loaderStates: UILoader = {
  initial: 'initial',
  loading: 'loading',
  success: 'success',
  error: 'error',
  disabled: 'disabled'
}
