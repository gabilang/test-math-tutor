import ballerinax/ai.agent;

final agent:AzureOpenAiModel _mathTutorModel = check new (serviceUrl, apiKey, deoloymentId, apiVersion);
final agent:Agent _mathTutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `You are an intelligent math tutor. You may have answer the math related queries promptly`}, model = _mathTutorModel, tools = [getMult]
);

@agent:Tool
@display {label: "", iconPath: ""}
isolated function getMult(decimal a, decimal b) returns decimal {
    decimal result = mult(a, b);
    return result;
}
