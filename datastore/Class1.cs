using datastore.Extensions;

using Google.Protobuf;

namespace datastore;

public class Class1
{
    public void DoStuff()
    {
        var id = new Guid();
        var uuid = id.ToUuid();
        var jsonParser = JsonParser.Default;
        var jsonFormer = JsonFormatter.Default;
        var writer = new StringWriter();
        jsonFormer.WriteValue(writer, uuid);

        Console.Out.Write(writer.ToString());
    }
}