abstract class FormSubmissionStatus {
  const FormSubmissionStatus({this.exception});
  final Exception? exception;
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus():super();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus{
  final dynamic exc;
  SubmissionFailed({required this.exc}):super(exception: exc);
}