using ExpenseTracker.Application.Dtos.Tag;

namespace ExpenseTracker.Application.Services.Tags
{
    public interface ITagService
    {
        Task<Domain.Entities.Tags> CreateTagsAsync(CreateTagRequest request);
        Task<IEnumerable<Domain.Entities.Tags>> GetAllTagsAsync();
    }
}
